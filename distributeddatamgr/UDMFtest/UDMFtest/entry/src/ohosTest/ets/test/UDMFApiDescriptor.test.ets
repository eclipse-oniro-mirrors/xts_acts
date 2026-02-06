/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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

const REFERENCE_URL =
  "https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis/js-apis-data-uniformTypeDescriptor.md#uniformdatatype";


export default function UDMFApiDescriptorTest() {
  describe('UDMFApiDescriptorTest', () => {
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100 start');
      expect(UTD.UniformDataType.TEXT).assertEqual("general.text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.text");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for all text.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/*");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0125
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125
     * @tc.desc      : Verify the properties of the entity type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125 start');
      expect(UTD.UniformDataType.ENTITY).assertEqual("general.entity");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.entity");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for physical hierarchy.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150
     * @tc.desc      : Verify the properties of the object type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150 start');
      expect(UTD.UniformDataType.OBJECT).assertEqual("general.object");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.object");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for logical hierarchy.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("*/*");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0175
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175
     * @tc.desc      : Verify the properties of the composite-object type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175 start');
      expect(UTD.UniformDataType.COMPOSITE_OBJECT).assertEqual("general.composite-object");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.COMPOSITE_OBJECT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.composite-object");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description)
        .assertEqual("Base type for mixed object. For example, a PDF file contains both text and special formatting data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200
     * @tc.desc      : Verify the properties of the plain text data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200 start');
      expect(UTD.UniformDataType.PLAIN_TEXT).assertEqual("general.plain-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.plain-text");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Text of unspecified encoding, with no markup.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_txt");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".txt,.text");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/plain");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300
     * @tc.desc      : Verify the properties of the html data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300 start');
      expect(UTD.UniformDataType.HTML).assertEqual("general.html");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.HTML);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.html");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("HTML text.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_html");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".html,.htm");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/html");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400
     * @tc.desc      : Verify the properties of the hyperlink data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400 start');
      expect(UTD.UniformDataType.HYPERLINK).assertEqual("general.hyperlink");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.HYPERLINK);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.hyperlink");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Hyperlink.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500
     * @tc.desc      : Verify the properties of the xml data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500 start');
      expect(UTD.UniformDataType.XML).assertEqual("general.xml");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.XML);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.xml");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("XML text.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_xml");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".xml");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/xml");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600
     * @tc.desc      : Verify the properties of the Source code data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600 start');
      expect(UTD.UniformDataType.SOURCE_CODE).assertEqual("general.source-code");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SOURCE_CODE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.source-code");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Generic source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700
     * @tc.desc      : Verify the properties of the Script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700 start');
      expect(UTD.UniformDataType.SCRIPT).assertEqual("general.script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("Base type for scripting language source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800
     * @tc.desc      : Verify the properties of the Shell script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800 start');
      expect(UTD.UniformDataType.SHELL_SCRIPT).assertEqual("general.shell-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SHELL_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.shell-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.script");
      expect(typeObj.description).assertEqual("Shell script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".sh,.command");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-shellscript");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900
     * @tc.desc      : Verify the properties of the C-shell script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900 start');
      expect(UTD.UniformDataType.CSH_SCRIPT).assertEqual("general.csh-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CSH_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.csh-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("C-shell script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".csh");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-csh");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000
     * @tc.desc      : Verify the properties of the Perl script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000 start');
      expect(UTD.UniformDataType.PERL_SCRIPT).assertEqual("general.perl-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PERL_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.perl-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Perl script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".pl,.pm");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-perl-script");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100
     * @tc.desc      : Verify the properties of the PHP script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100 start');
      expect(UTD.UniformDataType.PHP_SCRIPT).assertEqual("general.php-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PHP_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.php-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("PHP script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".php,.php3,.php4,.ph3,.ph4,.phtml");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-php-script,text/php,application/php");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200
     * @tc.desc      : Verify the properties of the Python script data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200 start');
      expect(UTD.UniformDataType.PYTHON_SCRIPT).assertEqual("general.python-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PYTHON_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.python-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Python script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".py");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-python-script");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300
     * @tc.desc      : Verify the properties of the Ruby script data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300 start');
      expect(UTD.UniformDataType.RUBY_SCRIPT).assertEqual("general.ruby-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RUBY_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.ruby-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Ruby script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".rb,.rbw");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/ruby-script");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400
     * @tc.desc      : Verify the properties of the TypeScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400 start');
      expect(UTD.UniformDataType.TYPE_SCRIPT).assertEqual("general.type-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TYPE_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.type-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("TypeScript source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ts");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500
     * @tc.desc      : Verify the properties of the JavaScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500 start');
      expect(UTD.UniformDataType.JAVA_SCRIPT).assertEqual("general.java-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.java-script");
      expect(typeObj.description).assertEqual("JavaScript source code.");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".js,.jscript,.javascript");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/javascript");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600
     * @tc.desc      : Verify the properties of the JavaScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600 start');
      expect(UTD.UniformDataType.C_HEADER).assertEqual("general.c-header");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_HEADER);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.c-header");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C header file.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".h");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-chdr");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700
     * @tc.desc      : Verify the properties of the C source code data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700 start');
      expect(UTD.UniformDataType.C_SOURCE).assertEqual("general.c-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_SOURCE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.c-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".c");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-csrc");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800
     * @tc.desc      : Verify the properties of the C++ header data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800 start');
      expect(UTD.UniformDataType.C_PLUS_PLUS_HEADER).assertEqual("general.c-plus-plus-header");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.c-plus-plus-header");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C++ header file.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".hpp,.h++,.hxx,.hh");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-c++hdr");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900
     * @tc.desc      : Verify the properties of the C++ source code data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900 start');
      expect(UTD.UniformDataType.C_PLUS_PLUS_SOURCE).assertEqual("general.c-plus-plus-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.c-plus-plus-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C++ source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".cp,.cpp,.c++,.cc,.cxx");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-c++src");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000
     * @tc.desc      : Verify the properties of the C++ source code data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000 start');
      expect(UTD.UniformDataType.JAVA_SOURCE).assertEqual("general.java-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_SOURCE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.java-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("Java source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".java,.jav");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/x-java");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100
     * @tc.desc      : Verify the properties of the Ebook data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100 start');
      expect(UTD.UniformDataType.EBOOK).assertEqual("general.ebook");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EBOOK);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.ebook");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Base type for ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200
     * @tc.desc      : Verify the properties of the EPUB ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200 start');
      expect(UTD.UniformDataType.EPUB).assertEqual("general.epub");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EPUB);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.epub");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("Electronic publication (EPUB) format.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".epub");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/epub+zip");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300
     * @tc.desc      : Verify the properties of the AZW ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300 start');
      expect(UTD.UniformDataType.AZW).assertEqual("com.amazon.azw");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AZW);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.amazon.azw");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("AZW ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".azw");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.amazon.ebook");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400
     * @tc.desc      : Verify the properties of the AZW3 ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400 start');
      expect(UTD.UniformDataType.AZW3).assertEqual("com.amazon.azw3");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AZW3);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.amazon.azw3");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("AZW3 ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".azw3");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.amazon.mobi8-ebook,application/x-mobi8-ebook");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500
     * @tc.desc      : Verify the properties of the KFX ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500 start');
      expect(UTD.UniformDataType.KFX).assertEqual("com.amazon.kfx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.KFX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.amazon.kfx");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("KFX ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".kfx");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600
     * @tc.desc      : Verify the properties of the MOBI ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600 start');
      expect(UTD.UniformDataType.MOBI).assertEqual("com.amazon.mobi");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MOBI);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.amazon.mobi");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("MOBI ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mobi");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-mobipocket-ebook");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700
     * @tc.desc      : Verify the properties of the Media data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700 start');
      expect(UTD.UniformDataType.MEDIA).assertEqual("general.media");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MEDIA);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.media");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for media.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800
     * @tc.desc      : Verify the properties of the Image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800 start');
      expect(UTD.UniformDataType.IMAGE).assertEqual("general.image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for images.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/*");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900
     * @tc.desc      : Verify the properties of the JPEG image format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900 start');
      expect(UTD.UniformDataType.JPEG).assertEqual("general.jpeg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JPEG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.jpeg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("JPEG image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.filenameExtensions.toString()).assertEqual(".jpg,.jpeg,.jpe");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/jpeg");
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000
     * @tc.desc      : Verify the properties of the png image format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000 start');
      expect(UTD.UniformDataType.PNG).assertEqual("general.png");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PNG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.png");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("PNG image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".png");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/png");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100
     * @tc.desc      : Verify the properties of the Raw image format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100 start');
      expect(UTD.UniformDataType.RAW_IMAGE).assertEqual("general.raw-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RAW_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.raw-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Base type for digital camera raw image formats.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200
     * @tc.desc      : Verify the properties of the TIFF image format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200 start');
      expect(UTD.UniformDataType.TIFF).assertEqual("general.tiff");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TIFF);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.tiff");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("TIFF image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".tif,.tiff");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/tiff");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300
     * @tc.desc      : Verify the properties of the Windows bitmap image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300 start');
      expect(UTD.UniformDataType.BMP).assertEqual("com.microsoft.bmp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.BMP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.bmp");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Windows bitmap image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".bmp,.bm");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/bmp,image/x-ms-bmp");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400
     * @tc.desc      : Verify the properties of the Windows icon data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400 start');
      expect(UTD.UniformDataType.ICO).assertEqual("com.microsoft.ico");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ICO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.ico");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Windows icon image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ico");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/ico,image/x-icon");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500
     * @tc.desc      : Verify the properties of the Adobe Photoshop document data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500 start');
      expect(UTD.UniformDataType.PHOTOSHOP_IMAGE).assertEqual("com.adobe.photoshop-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PHOTOSHOP_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.adobe.photoshop-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Adobe Photoshop document.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".psd");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("image/x-photoshop,image/photoshop,image/psd,application/photoshop");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600
     * @tc.desc      : Verify the properties of the Adobe Illustrator document data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600 start');
      expect(UTD.UniformDataType.AI_IMAGE).assertEqual("com.adobe.illustrator.ai-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AI_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.adobe.illustrator.ai-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Adobe Illustrator document.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ai");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700
     * @tc.desc      : Verify the properties of the Microsoft Word data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700 start');
      expect(UTD.UniformDataType.WORD_DOC).assertEqual("com.microsoft.word.doc");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORD_DOC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.word.doc");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft Word data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_doc");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".doc");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/msword");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800
     * @tc.desc      : Verify the properties of the Microsoft Excel data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800 start');
      expect(UTD.UniformDataType.EXCEL).assertEqual("com.microsoft.excel.xls");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EXCEL);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.excel.xls");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft Excel data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_xls");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".xls");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-excel");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900
     * @tc.desc      : Verify the properties of the Microsoft PowerPoint presentation data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900 start');
      expect(UTD.UniformDataType.PPT).assertEqual("com.microsoft.powerpoint.ppt");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.powerpoint.ppt");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft PowerPoint presentation.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ppt");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-powerpoint");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000
     * @tc.desc      : Verify the properties of the PDF data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000 start');
      expect(UTD.UniformDataType.PDF).assertEqual("com.adobe.pdf");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PDF);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.adobe.pdf");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("PDF data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_pdf");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".pdf");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/pdf");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100
     * @tc.desc      : Verify the properties of the PostScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100 start');
      expect(UTD.UniformDataType.POSTSCRIPT).assertEqual("com.adobe.postscript");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.adobe.postscript");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("PostScript data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ps");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/postscript");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200
     * @tc.desc      : Verify the properties of the Encapsulated PostScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200 start');
      expect(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT).assertEqual("com.adobe.encapsulated-postscript");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.adobe.encapsulated-postscript");
      expect(typeObj.belongingToTypes[0]).assertEqual("com.adobe.postscript");
      expect(typeObj.description).assertEqual("Encapsulated PostScript.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".eps");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300
     * @tc.desc      : Verify the properties of the Video data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300 start');
      expect(UTD.UniformDataType.VIDEO).assertEqual("general.video");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.video");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/*");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400
     * @tc.desc      : Verify the properties of the AVI video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400 start');
      expect(UTD.UniformDataType.AVI).assertEqual("general.avi");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AVI);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.avi");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("AVI video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".avi,.vfw");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/avi,video/msvideo,video/x-msvideo");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500
     * @tc.desc      : Verify the properties of the MPEG video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500 start');
      expect(UTD.UniformDataType.MPEG).assertEqual("general.mpeg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.mpeg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("MPEG-1 or MPEG-2 video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mpg,.mpeg,.m75,.m15,.mpe");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/mpg,video/mpeg,video/x-mpg,video/x-mpeg");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600
     * @tc.desc      : Verify the properties of the MPEG4 video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600 start');
      expect(UTD.UniformDataType.MPEG4).assertEqual("general.mpeg-4");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG4);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.mpeg-4");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("MPEG-4 video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mp4,.mp4v,.mpeg4");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/mp4,video/mp4v");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700
     * @tc.desc      : Verify the properties of the 3GPP video format data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700 start');
      expect(UTD.UniformDataType.VIDEO_3GPP).assertEqual("general.3gpp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO_3GPP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.3gpp");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("3GPP video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".3gp,.3gpp");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/3gpp");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800
     * @tc.desc      : Verify the properties of the 3GPP video format data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800 start');
      expect(UTD.UniformDataType.VIDEO_3GPP2).assertEqual("general.3gpp2");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO_3GPP2);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.3gpp2");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("3GPP2 video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".3g2,.3gp2,.3gpp2");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/3gpp2");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900
     * @tc.desc      : Verify the properties of the Windows WM video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WM).assertEqual("com.microsoft.windows-media-wm");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wm");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
      expect(typeObj.description).assertEqual("Windows WM video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".wm");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wm");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000
     * @tc.desc      : Verify the properties of the Windows WMV video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMV).assertEqual("com.microsoft.windows-media-wmv");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmv");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
      expect(typeObj.description).assertEqual("Windows WMV video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".wmv");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wmv");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100
     * @tc.desc      : Verify the properties of the Windows WMP video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMP).assertEqual("com.microsoft.windows-media-wmp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmp");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
      expect(typeObj.description).assertEqual("Windows WMP video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".wmp");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wmp");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200
     * @tc.desc      : Verify the properties of the Audio data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200 start');
      expect(UTD.UniformDataType.AUDIO).assertEqual("general.audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.audio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/*");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300
     * @tc.desc      : Verify the properties of the AAC audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300 start');
      expect(UTD.UniformDataType.AAC).assertEqual("general.aac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AAC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.aac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("AAC audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".aac");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/aac");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400
     * @tc.desc      : Verify the properties of the AIFF audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400 start');
      expect(UTD.UniformDataType.AIFF).assertEqual("general.aiff");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AIFF);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.aiff");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("AIFF audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".aiff");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/aiff");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500
     * @tc.desc      : Verify the properties of the ALAC audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500 start');
      expect(UTD.UniformDataType.ALAC).assertEqual("general.alac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ALAC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.alac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("ALAC audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".alac");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/alac");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600
     * @tc.desc      : Verify the properties of the FLAC audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600 start');
      expect(UTD.UniformDataType.FLAC).assertEqual("general.flac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FLAC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.flac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("FLAC audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_flac");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".flac");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/flac");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700
     * @tc.desc      : Verify the properties of the MP3 audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700 start');
      expect(UTD.UniformDataType.MP3).assertEqual("general.mp3");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MP3);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.mp3");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("MPEG-3 audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_mp3");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mp3");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/mp3");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800
     * @tc.desc      : Verify the properties of the OGG audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800 start');
      expect(UTD.UniformDataType.OGG).assertEqual("general.ogg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OGG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.ogg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("OGG audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ogg");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/ogg");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900
     * @tc.desc      : Verify the properties of the PCM audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900 start');
      expect(UTD.UniformDataType.PCM).assertEqual("general.pcm");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PCM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.pcm");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("PCM audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".pcm");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/pcm");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000
     * @tc.desc      : Verify the properties of the Windows WMA audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMA).assertEqual("com.microsoft.windows-media-wma");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wma");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio,com.microsoft.advanced-systems-format");
      expect(typeObj.description).assertEqual("Windows WMA audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_wma");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".wma");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-ms-wma");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100
     * @tc.desc      : Verify the properties of the Waveform audio format data type created by Microsoft
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100 start');
      expect(UTD.UniformDataType.WAVEFORM_AUDIO).assertEqual("com.microsoft.waveform-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WAVEFORM_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.waveform-audio");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio,com.microsoft.advanced-systems-format");
      expect(typeObj.description).assertEqual("Waveform audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_wav");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".wav,.wave");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/wav,audio/wave,audio/x-wav");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200
     * @tc.desc      : Verify the properties of the Windows WMX audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMX).assertEqual("com.microsoft.windows-media-wmx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmx");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
      expect(typeObj.description).assertEqual("Windows WMX video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".wmx");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wmx");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300
     * @tc.desc      : Verify the properties of the Windows WVX audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WVX).assertEqual("com.microsoft.windows-media-wvx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WVX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wvx");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
      expect(typeObj.description).assertEqual("Windows WVX video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".wvx");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wvx");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400
     * @tc.desc      : Verify the properties of the Windows WAX audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WAX).assertEqual("com.microsoft.windows-media-wax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WAX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wax");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio,com.microsoft.advanced-systems-format");
      expect(typeObj.description).assertEqual("Windows WAX audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".wax");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-ms-wax");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500
     * @tc.desc      : Verify the properties of the File data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500 start');
      expect(UTD.UniformDataType.FILE).assertEqual("general.file");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FILE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.file");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
      expect(typeObj.description).assertEqual("Base type for file.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600
     * @tc.desc      : Verify the properties of the Directory data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600 start');
      expect(UTD.UniformDataType.DIRECTORY).assertEqual("general.directory");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DIRECTORY);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.directory");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
      expect(typeObj.description).assertEqual("Base type for directory.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_folder");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700
     * @tc.desc      : Verify the properties of the Folder data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700 start');
      expect(UTD.UniformDataType.FOLDER).assertEqual("general.folder");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FOLDER);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.folder");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.directory");
      expect(typeObj.description).assertEqual("Base type for folder.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_folder");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800
     * @tc.desc      : Verify the properties of the Symlink data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800 start');
      expect(UTD.UniformDataType.SYMLINK).assertEqual("general.symlink");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SYMLINK);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.symlink");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
      expect(typeObj.description).assertEqual("Base type for symlink.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900
     * @tc.desc      : Verify the properties of the Symlink data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900 start');
      expect(UTD.UniformDataType.ARCHIVE).assertEqual("general.archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for an archive of files and directories.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000
     * @tc.desc      : Verify the properties of the Bzip2 archive file data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000 start');
      expect(UTD.UniformDataType.BZ2_ARCHIVE).assertEqual("general.bz2-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.BZ2_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.bz2-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("BZip2 archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".bz2,.bzip2");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-bzip2");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100
     * @tc.desc      : Verify the properties of the Disk image archive file data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100 start');
      expect(UTD.UniformDataType.DISK_IMAGE).assertEqual("general.disk-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DISK_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.disk-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Base type for items mountable as a volume.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200
     * @tc.desc      : Verify the properties of the Tar archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200 start');
      expect(UTD.UniformDataType.TAR_ARCHIVE).assertEqual("general.tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TAR_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Tar archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".tar");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-tar,application/tar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300
     * @tc.desc      : Verify the properties of the Zip archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300 start');
      expect(UTD.UniformDataType.ZIP_ARCHIVE).assertEqual("general.zip-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ZIP_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.zip-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Zip archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_zip");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".zip");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/zip");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400
     * @tc.desc      : Verify the properties of the Java archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400 start');
      expect(UTD.UniformDataType.JAVA_ARCHIVE).assertEqual("com.sun.java-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.sun.java-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Java archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".jar");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/java-archive");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500
     * @tc.desc      : Verify the properties of the GNU archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500 start');
      expect(UTD.UniformDataType.GNU_TAR_ARCHIVE).assertEqual("org.gnu.gnu-tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_TAR_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("GNU archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".gtar");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-gtar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600
     * @tc.desc      : Verify the properties of the Gzip archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600 start');
      expect(UTD.UniformDataType.GNU_ZIP_ARCHIVE).assertEqual("org.gnu.gnu-zip-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_ZIP_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-zip-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Gzip archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".gz,.gzip");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-gzip,application/gzip");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700
     * @tc.desc      : Verify the properties of the Gzip tar archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700 start');
      expect(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE).assertEqual("org.gnu.gnu-zip-tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-zip-tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Gzip tar archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".tgz");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-gtar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800
     * @tc.desc      : Verify the properties of the Calendar data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800 start');
      expect(UTD.UniformDataType.CALENDAR).assertEqual("general.calendar");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CALENDAR);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.calendar");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Base type for scheduled events.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_calendar");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/calendar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900
     * @tc.desc      : Verify the properties of the Contact data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900 start');
      expect(UTD.UniformDataType.CONTACT).assertEqual("general.contact");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.contact");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for contact information.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000
     * @tc.desc      : Verify the properties of the Database data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000 start');
      expect(UTD.UniformDataType.DATABASE).assertEqual("general.database");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DATABASE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.database");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for databases.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100
     * @tc.desc      : Verify the properties of the Message data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100 start');
      expect(UTD.UniformDataType.MESSAGE).assertEqual("general.message");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.message");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for messages.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200
     * @tc.desc      : Verify the properties of the vcard format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200 start');
      expect(UTD.UniformDataType.VCARD).assertEqual("general.vcard");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VCARD);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.vcard");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for electronic business card.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".vcf,.vcard");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/vcard,text/x-vcard");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300
     * @tc.desc      : Verify the properties of the navigation data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300 start');
      expect(UTD.UniformDataType.NAVIGATION).assertEqual("general.navigation");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.navigation");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for navigation.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400
     * @tc.desc      : Verify the properties of the Location data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400 start');
      expect(UTD.UniformDataType.LOCATION).assertEqual("general.location");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.location");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.navigation");
      expect(typeObj.description).assertEqual("Navigation location.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500
     * @tc.desc      : Verify the properties of the openharmony.form  data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500 start');
      expect(UTD.UniformDataType.OPENHARMONY_FORM).assertEqual("openharmony.form");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_FORM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.form");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined form.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600
     * @tc.desc      : Verify the properties of the openharmony.app-item  data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600 start');
      expect(UTD.UniformDataType.OPENHARMONY_APP_ITEM).assertEqual("openharmony.app-item");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_APP_ITEM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.app-item");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined app item.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700
     * @tc.desc      : Verify the properties of the openharmony.pixel-map data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700 start');
      expect(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP).assertEqual("openharmony.pixel-map");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.pixel-map");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("OpenHarmony system defined pixel map.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800
     * @tc.desc      : Verify the properties of the openharmony.atomic-service data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800 start');
      expect(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE).assertEqual("openharmony.atomic-service");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.atomic-service");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined atomic service.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8825
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825
     * @tc.desc      : Verify the properties of the openharmony.package data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825 start');
      expect(UTD.UniformDataType.OPENHARMONY_PACKAGE).assertEqual("openharmony.package");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PACKAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.package");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.directory");
      expect(typeObj.description)
        .assertEqual("OpenHarmony system defined package (that is, a directory presented to the user as a file).");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850
     * @tc.desc      : Verify the properties of the openharmony.hap data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850 start');
      expect(UTD.UniformDataType.OPENHARMONY_HAP).assertEqual("openharmony.hap");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HAP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.hap");
      expect(typeObj.belongingToTypes[0]).assertEqual("openharmony.package");
      expect(typeObj.description).assertEqual("OpenHarmony system defined ability package.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".hap");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900
     * @tc.desc      : Illegal parameters null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900 start');
      try {
        let typeObj = UTD.getTypeDescriptor(null);
        console.log('typeObj start' + typeObj);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000
     * @tc.desc      : Illegal parameters undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000 start');
      try {
        let typeObj = UTD.getTypeDescriptor(undefined);
        console.log('typeObj start' + typeObj);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100
     * @tc.desc      : Illegal parameters general.hello
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100 start');
      try {
        let typeObj = UTD.getTypeDescriptor("general.hello");
        console.log('typeObj start' + typeObj);
        if (typeObj == null) {
          console.log("Illegal parameters general.hello is :" + (typeObj == null));
        }
        expect(typeObj == null).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200
     * @tc.desc      : Illegal parameters ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200 start');
      try {
        let typeObj = UTD.getTypeDescriptor("");
        console.log('typeObj start' + typeObj);
        expect(typeObj == null).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300
     * @tc.desc      : Equals the same parameter types
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300 start');
      try {
        let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        let result = typeObj1.equals(typeObj2);
        expect(result == true).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400
     * @tc.desc      : Equals the different parameter types
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400 start');
      try {
        let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
        let result = typeObj1.equals(typeObj2);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("vSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500
     * @tc.desc      : Equals the different parameter types -- Illegal params null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.equals(null);
        console.log("result" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600
     * @tc.desc      : Equals the different parameter types -- Illegal params undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.equals(undefined);
        console.log("result" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610
     * @tc.desc      : parameters to belongsTo -- The relationship between the object of the parameter and the parent of the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9615
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615
     * @tc.desc      : parameters to belongsTo -- The relationship between the object of the parameter and the next level of the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.NAVIGATION);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620
     * @tc.desc      : parameters to belongsTo -- The relationship between the object of the parameter and the two levels above the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9625
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625
     * @tc.desc      : parameters to belongsTo -- ToThe relationship between the object of the parameter and the two levels below the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.LOCATION);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630
     * @tc.desc      : parameter to belongsTo()-- The relationship between the object of the parameter and the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CALENDAR);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.CALENDAR);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9635
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635
     * @tc.desc      : parameter to belongsTo()-- The relationship between the object of the parameter and the parameter at the same level
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.TEXT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640
     * @tc.desc      : parameter to belongsTo()-- The relationship between the object of the parameter and the parameter at the same level
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9645
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645
     * @tc.desc      : Invalid parameter to belongsTo() -- The relationship between the object of the parameter and "".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
      try {
        let result = typeObj1.belongsTo("");
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9650
     * @tc.desc      : Invalid parameter to belongsTo() --The relationship between the object of the parameter and null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9650 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      try {
        let result = typeObj1.belongsTo(null);
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9650 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9655
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9655
     * @tc.desc      : Invalid parameter to belongsTo() --The relationship between the object of the parameter and undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9655', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9655 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.IMAGE);
      try {
        let result = typeObj1.belongsTo(undefined);
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9655 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660
     * @tc.desc      : Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.belongsTo("general.hello");
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9665
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665
     * @tc.desc      : parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the previous level of the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670
     * @tc.desc      : parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the next level of the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.NAVIGATION);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9675
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675
     * @tc.desc      : parameter to isLowerLevelType()  --The low-level relationship between the object of a parameter and the two levels above the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680
     * @tc.desc      : parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the lower two levels of the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.LOCATION);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9685
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685
     * @tc.desc      : parameter to isLowerLevelType()--A low-level relationship between an object of a parameter and the same parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.COMPOSITE_OBJECT);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.COMPOSITE_OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690
     * @tc.desc      : parameter to isLowerLevelType()--The low-level relationship between the object of a parameter and the parameter at the same level
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9695
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695
     * @tc.desc      : parameter to isLowerLevelType()--The low-level relationship between the object of a parameter and the parameter at the same level
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.TEXT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700
     * @tc.desc      : Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to "".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType("");
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9705
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705
     * @tc.desc      : Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to "general.hello".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType("general.hello");
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710
     * @tc.desc      : Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to null.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType(null);
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9715
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715
     * @tc.desc      : Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType(undefined);
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720
     * @tc.desc      : parameter to isHigherLevelType()--The high-level relationship between the object of a parameter and the level above the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.NAVIGATION);
        console.log("result==>" + result);
        expect(result == true).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9725
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725
     * @tc.desc      : parameter to isHigherLevelType() --The high-level relationship between the object of a parameter and the level below the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730
     * @tc.desc      : parameter to isHigherLevelType() --The object of a parameter has a high-level relationship with two levels above the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.LOCATION);
        console.log("result==>" + result);
        expect(result == true).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9735
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735
     * @tc.desc      : parameter to isHigherLevelType() --The object of a parameter has a high-level relationship with the two levels below the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740
     * @tc.desc      : parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and the parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.C_HEADER);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.C_HEADER);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9745
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745
     * @tc.desc      : parameter to isHigherLevelType() --The object of a parameter is a high-level relationship with the parameter at the same level
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750
     * @tc.desc      : parameter to isHigherLevelType() --The object of a parameter is a high-level relationship with the parameter at the same level
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.MESSAGE);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9755
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755
     * @tc.desc      : Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and "".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      try {
        let result = typeObj1.isHigherLevelType("");
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9760
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760
     * @tc.desc      : Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and "general.hello".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.TEXT);
      try {
        let result = typeObj1.isHigherLevelType("general.hello");
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9765
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765
     * @tc.desc      : Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and null.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      try {
        let result = typeObj1.isHigherLevelType(null);
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770
     * @tc.desc      : Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        let result = typeObj1.isHigherLevelType(undefined);
        console.log("result==>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9775
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775
     * @tc.desc      : parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".xls"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".xls");
        console.log("result=====>" + result);
        expect(result == UTD.UniformDataType.EXCEL).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9780
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameter is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(null);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9785
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".hello"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785 start');
      try {
        let dynamicType = UTD.getUniformDataTypeByFilenameExtension(".hello");
        console.log("UDMF,result=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
        console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
        console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
        console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
        console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
        expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
        expect(dynamicTypeObj.belongingToTypes.length).assertEqual(0);
        expect(dynamicTypeObj.filenameExtensions[0]).assertEqual(".hello");
        expect(dynamicTypeObj.mimeTypes.length).assertEqual(0);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameter is ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension("");
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9795
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9795
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameter is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9795', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9795 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9795 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800
     * @tc.desc      : parameter to getUniformDataTypeByFilenameExtension()  --parameters are ".doc" and UTD.UniformDataType.WORD_DOC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".doc", UTD.UniformDataType.WORD_DOC);
        console.log("result=====>" + result);
        expect(result == UTD.UniformDataType.WORD_DOC).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9805
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are ".doc" and invalid parameter UTD.UniformDataType.PPT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805 start');
      try {
        let dynamicType = UTD.getUniformDataTypeByFilenameExtension(".doc", UTD.UniformDataType.PPT);
        console.log("result=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
        console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
        console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
        console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
        console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
        expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
        expect(dynamicTypeObj.belongingToTypes[0]).assertEqual(UTD.UniformDataType.PPT);
        expect(dynamicTypeObj.filenameExtensions[0]).assertEqual(".doc");
        expect(dynamicTypeObj.mimeTypes.length).assertEqual(0);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9815
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9815
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are ".doc" and invalid parameter null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9815', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9815 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", null);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9815 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9820
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are ".doc" and invalid parameter undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9820 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9820 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9825
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are invalid parameter ".hello" and UTD.UniformDataType.ICO
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825 start');
      try {
        let dynamicType = UTD.getUniformDataTypeByFilenameExtension(".hello", UTD.UniformDataType.ICO);
        console.log("dynamicType=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
        console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
        console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
        console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
        console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
        expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
        expect(dynamicTypeObj.belongingToTypes[0]).assertEqual(UTD.UniformDataType.ICO);
        expect(dynamicTypeObj.filenameExtensions[0]).assertEqual(".hello");
        expect(dynamicTypeObj.mimeTypes.length).assertEqual(0);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are invalid parameter ".hello" and ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", "");
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9835
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835
     * @tc.desc      : parameter to getUniformDataTypeByMIMEType() --"image/tiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff");
        console.log("result=====>" + result);
        expect(result == "general.tiff").assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9840
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is "hello"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840 start');
      try {
        let dynamicType = UTD.getUniformDataTypeByMIMEType("hello");
        console.log("dynamicType=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
        console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
        console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
        console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
        console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
        expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
        expect(dynamicTypeObj.belongingToTypes.length).assertEqual(0);
        expect(dynamicTypeObj.mimeTypes[0]).assertEqual("hello");
        expect(dynamicTypeObj.filenameExtensions.length).assertEqual(0);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9845
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("");
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9850
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9850 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType(null);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9850 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9855
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9855
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9855', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9855 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType(undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9855 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9860
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860
     * @tc.desc      : parameter to getUniformDataTypeByMIMEType()  --parameter are "image/tiff" and "general.type-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("audio/x-ms-wma", UTD.UniformDataType.WINDOWS_MEDIA_WMA);
        console.log("result=====>" + result);
        expect(result == UTD.UniformDataType.WINDOWS_MEDIA_WMA).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9865
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter are "image/tiff"and invalid parameter "general.type-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865 start');
      try {
        let dynamicType = UTD.getUniformDataTypeByMIMEType("image/tiff", UTD.UniformDataType.TYPE_SCRIPT);
        console.log("dynamicType=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
        console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
        console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
        console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
        console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
        expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
        expect(dynamicTypeObj.belongingToTypes[0]).assertEqual(UTD.UniformDataType.TYPE_SCRIPT);
        expect(dynamicTypeObj.mimeTypes[0]).assertEqual("image/tiff");
        expect(dynamicTypeObj.filenameExtensions.length).assertEqual(0);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9870
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9870
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter are "image/tiff"and invalid parameter null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9870 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", null);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9870 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9875
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9875
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter are "image/tiff"and invalid parameter undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9875', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9875 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9875 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9880
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter are invalid parameter "hello" and  UTD.UniformDataType.WINDOWS_MEDIA_WMV
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880 start');
      try {
        let dynamicType = UTD.getUniformDataTypeByMIMEType("hello", UTD.UniformDataType.WINDOWS_MEDIA_WMV);
        console.log("dynamicType=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
        console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
        console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
        console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
        console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
        expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
        expect(dynamicTypeObj.belongingToTypes[0]).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
        expect(dynamicTypeObj.mimeTypes[0]).assertEqual("hello");
        expect(dynamicTypeObj.filenameExtensions.length).assertEqual(0);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9885
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter are "image/tiff"and invalid parameter "general.hello"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", "general.hello");
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9890
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter are "image/tiff"and invalid parameter ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", "");
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are ".wav" and invalid parameter "general.hello"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", "general.hello");
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9815 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0210
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210
     * @tc.desc      : Verify the properties of the com.real.smil data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210 start');
      expect(UTD.UniformDataType.SMIL).assertEqual("com.real.smil");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SMIL);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.real.smil");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.xml");
      expect(typeObj.description).assertEqual("Real synchronized multimedia integration language.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".smil");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/smil");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220
     * @tc.desc      : Verify the properties of the markdown data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220 start');
      expect(UTD.UniformDataType.MARKDOWN).assertEqual("general.markdown");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MARKDOWN);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.markdown");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Markdown format.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".md,.markdown,.markdn,.mdown");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/markdown");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0240
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240
     * @tc.desc      : Verify the properties of the com.j2.jfx-fax data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240 start');
      expect(UTD.UniformDataType.JFX_FAX).assertEqual("com.j2.jfx-fax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JFX_FAX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.j2.jfx-fax");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.fax");
      expect(typeObj.description).assertEqual("J2 fax.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".jfx");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250
     * @tc.desc      : Verify the properties of the xbitmap-image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250 start');
      expect(UTD.UniformDataType.XBITMAP_IMAGE).assertEqual("general.xbitmap-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.XBITMAP_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.xbitmap-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("X bitmap image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".xbm");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/x-xbitmap,image/x-xbm");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0260
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260
     * @tc.desc      : Verify the properties of the com.sgi.sgi-image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260 start');
      expect(UTD.UniformDataType.SGI_IMAGE).assertEqual("com.sgi.sgi-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SGI_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.sgi.sgi-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Silicon Graphics image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".sgi");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/sgi");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270
     * @tc.desc      : Verify the properties of the com.kodak.flashpix.image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270 start');
      expect(UTD.UniformDataType.FLASHPIX_IMAGE).assertEqual("com.kodak.flashpix.image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FLASHPIX_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.kodak.flashpix.image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("FlashPix image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".fpx");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/fpx,application/vnd.fpx");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280
     * @tc.desc      : Verify the properties of the com.real.realmedia data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280 start');
      expect(UTD.UniformDataType.REALMEDIA).assertEqual("com.real.realmedia");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.REALMEDIA);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.real.realmedia");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("RealMedia.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".rm");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.rn-realmedia");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290
     * @tc.desc      : Verify the properties of the au-audio data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290 start');
      expect(UTD.UniformDataType.AU_AUDIO).assertEqual("general.au-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AU_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.au-audio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Au file format.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".au,.snd");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/basic,audio/au,audio/snd");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0310
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310
     * @tc.desc      : Verify the properties of the com.digidesign.sd2-audio data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310 start');
      expect(UTD.UniformDataType.SD2_AUDIO).assertEqual("com.digidesign.sd2-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SD2_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.digidesign.sd2-audio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Digidesign Sound Designer II audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".sd2");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-sd2");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320
     * @tc.desc      : Verify the properties of the raw-image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320 start');
      expect(UTD.UniformDataType.RAW_IMAGE).assertEqual("general.raw-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RAW_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.raw-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Base type for digital camera raw image formats.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0330
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330
     * @tc.desc      : Verify the properties of the fax data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330 start');
      expect(UTD.UniformDataType.FAX).assertEqual("general.fax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FAX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.fax");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Base type for fax images.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340
     * @tc.desc      : Verify the properties of the com.js.efx-fax data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340 start');
      expect(UTD.UniformDataType.EFX_FAX).assertEqual("com.js.efx-fax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EFX_FAX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.js.efx-fax");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.fax");
      expect(typeObj.description).assertEqual("eFax fax.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".efx");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/efax");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360
     * @tc.desc      : Verify the properties of the com.truevision.tga-image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360 start');
      expect(UTD.UniformDataType.TGA_IMAGE).assertEqual("com.truevision.tga-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TGA_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.truevision.tga-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("TGA image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".tga");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/targa,image/tga,application/tga");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0370
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370
     * @tc.desc      : Verify the properties of the com.ilm.openexr-image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370 start');
      expect(UTD.UniformDataType.OPENEXR_IMAGE).assertEqual("com.ilm.openexr-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENEXR_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.ilm.openexr-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("OpenEXR image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".exr");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0380
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380
     * @tc.desc      : Verify the properties of the aifc-audio data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380 start');
      expect(UTD.UniformDataType.AIFC_AUDIO).assertEqual("general.aifc-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AIFC_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.aifc-audio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Audio Interchange File Format.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".aifc,.aif,.aiff");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-aiff");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0390
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390
     * @tc.desc      : Verify the properties of the com.real.realaudio data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390 start');
      expect(UTD.UniformDataType.REALAUDIO).assertEqual("com.real.realaudio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.REALAUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.real.realaudio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("RealMedia audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ram,.ra");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/vnd.rn-realaudio,audio/x-pn-realaudio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0410
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410
     * @tc.desc      : Verify the properties of the org.openxmlformats.openxml data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410 start');
      expect(UTD.UniformDataType.OPENXML).assertEqual("org.openxmlformats.openxml");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENXML);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.openxmlformats.openxml");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Office Open XML.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420
     * @tc.desc      : Verify the properties of the org.openxmlformats.wordprocessingml.document data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420 start');
      expect(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT).assertEqual("org.openxmlformats.wordprocessingml.document");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.openxmlformats.wordprocessingml.document");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Office Open XML Document.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".docx");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430
     * @tc.desc      : Verify the properties of the org.openxmlformats.spreadsheetml.sheet data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430 start');
      expect(UTD.UniformDataType.SPREADSHEETML_SHEET).assertEqual("org.openxmlformats.spreadsheetml.sheet");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SPREADSHEETML_SHEET);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.openxmlformats.spreadsheetml.sheet");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Office Open XML Workbook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".xlsx");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440
     * @tc.desc      : Verify the properties of the org.openxmlformats.presentationml.presentation data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440 start');
      expect(UTD.UniformDataType.PRESENTATIONML_PRESENTATION)
        .assertEqual("org.openxmlformats.presentationml.presentation");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PRESENTATIONML_PRESENTATION);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.openxmlformats.presentationml.presentation");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Office Open XML Presentation.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".pptx");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("application/vnd.openxmlformats-officedocument.presentationml.presentation");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450
     * @tc.desc      : Verify the properties of the org.oasis.opendocument data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450 start');
      expect(UTD.UniformDataType.OPENDOCUMENT).assertEqual("org.oasis.opendocument");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.oasis.opendocument");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Open Document Format for Office Applications.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0460
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460
     * @tc.desc      : Verify the properties of the org.oasis.opendocument.text data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_TEXT).assertEqual("org.oasis.opendocument.text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.oasis.opendocument.text");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object,org.oasis.opendocument");
      expect(typeObj.description).assertEqual("OpenDocument Text.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".odt,.fodt");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.text");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470
     * @tc.desc      : Verify the properties of the org.oasis.opendocument.spreadsheet data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET).assertEqual("org.oasis.opendocument.spreadsheet");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.oasis.opendocument.spreadsheet");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object,org.oasis.opendocument");
      expect(typeObj.description).assertEqual("OpenDocument Spreadsheet.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ods,.fods");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.spreadsheet");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480
     * @tc.desc      : Verify the properties of the org.oasis.opendocument.presentation data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION).assertEqual("org.oasis.opendocument.presentation");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.oasis.opendocument.presentation");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object,org.oasis.opendocument");
      expect(typeObj.description).assertEqual("OpenDocument Presentation.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".odp,.fodp");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.presentation");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0490
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490
     * @tc.desc      : Verify the properties of the org.oasis.opendocument.graphics data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS).assertEqual("org.oasis.opendocument.graphics");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.oasis.opendocument.graphics");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object,org.oasis.opendocument");
      expect(typeObj.description).assertEqual("OpenDocument Graphics.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".odg,.fodg");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.graphics");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510
     * @tc.desc      : Verify the properties of the org.oasis.opendocument.formula data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_FORMULA).assertEqual("org.oasis.opendocument.formula");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_FORMULA);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("org.oasis.opendocument.formula");
      expect(typeObj.belongingToTypes.toString()).assertEqual("org.oasis.opendocument");
      expect(typeObj.description).assertEqual("OpenDocument Formulat.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".odf");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.formula");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520
     * @tc.desc      : Verify the properties of the com.allume.stuffit-archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520 start');
      expect(UTD.UniformDataType.STUFFIT_ARCHIVE).assertEqual("com.allume.stuffit-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.STUFFIT_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.allume.stuffit-archive");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Stuffit archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".sit,.sitx");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-stuffit,application/x-sit,application/stuffit");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0530
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530
     * @tc.desc      : Verify the properties of the vcs data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530 start');
      expect(UTD.UniformDataType.VCS).assertEqual("general.vcs");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VCS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.vcs");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.calendar");
      expect(typeObj.description).assertEqual("vCalendar type.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".vcs");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/calendar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540
     * @tc.desc      : Verify the properties of the ics data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540 start');
      expect(UTD.UniformDataType.ICS).assertEqual("general.ics");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ICS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.ics");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.calendar");
      expect(typeObj.description).assertEqual("iCalendar type.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ics");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/calendar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550
     * @tc.desc      : Verify the properties of the executable data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550 start');
      expect(UTD.UniformDataType.EXECUTABLE).assertEqual("general.executable");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EXECUTABLE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.executable");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for executable data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0560
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560
     * @tc.desc      : Verify the properties of the com.microsoft.portable-executable data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560 start');
      expect(UTD.UniformDataType.PORTABLE_EXECUTABLE).assertEqual("com.microsoft.portable-executable");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PORTABLE_EXECUTABLE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.microsoft.portable-executable");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.executable");
      expect(typeObj.description).assertEqual("Microsoft Windows application.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".exe,.dll");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.microsoft.portable-executable");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570
     * @tc.desc      : Verify the properties of the com.sun.java-class data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570 start');
      expect(UTD.UniformDataType.SUN_JAVA_CLASS).assertEqual("com.sun.java-class");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SUN_JAVA_CLASS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.sun.java-class");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.executable");
      expect(typeObj.description).assertEqual("Java class.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".class");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0580
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580
     * @tc.desc      : Verify the properties of the font data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580 start');
      expect(UTD.UniformDataType.FONT).assertEqual("general.font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FONT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.font");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for fonts.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590
     * @tc.desc      : Verify the properties of the truetype-font data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590 start');
      expect(UTD.UniformDataType.TRUETYPE_FONT).assertEqual("general.truetype-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TRUETYPE_FONT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.truetype-font");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.font");
      expect(typeObj.description).assertEqual("TrueType font.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ttf");
      expect(typeObj.mimeTypes.toString()).assertEqual("font/ttf");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610
     * @tc.desc      : Verify the properties of the truetype-collection-font data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610 start');
      expect(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT).assertEqual("general.truetype-collection-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.truetype-collection-font");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.font");
      expect(typeObj.description).assertEqual("TrueType collection font.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ttc");
      expect(typeObj.mimeTypes.toString()).assertEqual("font/collection");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620
     * @tc.desc      : Verify the properties of the opentype-font data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620 start');
      expect(UTD.UniformDataType.OPENTYPE_FONT).assertEqual("general.opentype-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENTYPE_FONT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.opentype-font");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.font");
      expect(typeObj.description).assertEqual("OpenType font.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".otf");
      expect(typeObj.mimeTypes.toString()).assertEqual("font/otf");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630
     * @tc.desc      : Verify the properties of the com.adobe.postscript-font data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630 start');
      expect(UTD.UniformDataType.POSTSCRIPT_FONT).assertEqual("com.adobe.postscript-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT_FONT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.adobe.postscript-font");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.font");
      expect(typeObj.description).assertEqual("PostScript font.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640
     * @tc.desc      : Verify the properties of the com.adobe.postscript-pfb-font data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640 start');
      expect(UTD.UniformDataType.POSTSCRIPT_PFB_FONT).assertEqual("com.adobe.postscript-pfb-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT_PFB_FONT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.adobe.postscript-pfb-font");
      expect(typeObj.belongingToTypes.toString()).assertEqual("com.adobe.postscript-font");
      expect(typeObj.description).assertEqual("Printer Font Binary, PostScript Type 1 outline font.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".pfb");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-font");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650
     * @tc.desc      : Verify the properties of the com.adobe.postscript-pfa-font data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650 start');
      expect(UTD.UniformDataType.POSTSCRIPT_PFA_FONT).assertEqual("com.adobe.postscript-pfa-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT_PFA_FONT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.adobe.postscript-pfa-font");
      expect(typeObj.belongingToTypes.toString()).assertEqual("com.adobe.postscript-font");
      expect(typeObj.description).assertEqual("Printer Pont ASCII file, PostScript Type 1 outline font.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".pfa");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-font");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660
     * @tc.desc      : Verify the properties of the openharmony.form data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660 start');
      expect(UTD.UniformDataType.OPENHARMONY_FORM).assertEqual("openharmony.form");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_FORM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.form");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined form.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670
     * @tc.desc      : Verify the properties of the openharmony.app-item data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670 start');
      expect(UTD.UniformDataType.OPENHARMONY_APP_ITEM).assertEqual("openharmony.app-item");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_APP_ITEM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.app-item");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined app item.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680
     * @tc.desc      : Verify the properties of the openharmony.pixel-map data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680 start');
      expect(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP).assertEqual("openharmony.pixel-map");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.pixel-map");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.image");
      expect(typeObj.description).assertEqual("OpenHarmony system defined pixel map.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690
     * @tc.desc      : Verify the properties of the openharmony.atomic-service data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690 start');
      expect(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE).assertEqual("openharmony.atomic-service");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.atomic-service");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined atomic service.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710
     * @tc.desc      : Verify the properties of the openharmony.package data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710 start');
      expect(UTD.UniformDataType.OPENHARMONY_PACKAGE).assertEqual("openharmony.package");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PACKAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.package");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.directory");
      expect(typeObj.description)
        .assertEqual("OpenHarmony system defined package (that is, a directory presented to the user as a file).");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720
     * @tc.desc      : Verify the properties of the openharmony.hap data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720 start');
      expect(UTD.UniformDataType.OPENHARMONY_HAP).assertEqual("openharmony.hap");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HAP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.hap");
      expect(typeObj.belongingToTypes.toString()).assertEqual("openharmony.package");
      expect(typeObj.description).assertEqual("OpenHarmony system defined ability package.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".hap");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730
     * @tc.desc      : Verify the properties of the openharmony.hdoc data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730 start');
      expect(UTD.UniformDataType.OPENHARMONY_HDOC).assertEqual("openharmony.hdoc");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HDOC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.hdoc");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("OpenHarmony system AppNotepad data format.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".hdoc");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740
     * @tc.desc      : Verify the properties of the openharmony.styled-string data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740 start');
      expect(UTD.UniformDataType.OPENHARMONY_STYLED_STRING).assertEqual("openharmony.styled-string");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_STYLED_STRING);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.styled-string");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined styled string.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750
     * @tc.desc      : Verify the properties of the openharmony.hinote data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750 start');
      expect(UTD.UniformDataType.OPENHARMONY_HINOTE).assertEqual("openharmony.hinote");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HINOTE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.hinote");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("OpenHarmony system Notes data format.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".hinote");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0760
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760
     * @tc.desc      : Verify the properties of the openharmony.want data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760 start');
      expect(UTD.UniformDataType.OPENHARMONY_WANT).assertEqual("openharmony.want");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_WANT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("openharmony.want");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined Want.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770
     * @tc.desc      : Verify the properties of the com.sun.java-class data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770 start');
      expect(UTD.UniformDataType.SUN_JAVA_CLASS).assertEqual("com.sun.java-class");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SUN_JAVA_CLASS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("com.sun.java-class");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.executable");
      expect(typeObj.description).assertEqual("Java class.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".class");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0790
     * @tc.desc      : getUniformDataTypeByMIMEType --Fuzzy queries parameter --image/*
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0790 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/*");
        console.log("result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.IMAGE);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810
     * @tc.desc      : getUniformDataTypeByMIMEType --Fuzzy queries parameter --video/*
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("video/*");
        console.log("result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.VIDEO);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820
     * @tc.desc      : getUniformDataTypeByMIMEType --Fuzzy queries parameter --audio/*
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("audio/*");
        console.log("result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.AUDIO);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850
     * @tc.desc      : parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".mytext" "general.plain-text"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj = UTD.getTypeDescriptor(result);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("flex.zh4yd2z3fnzsxeylmfzygyyljnywxizlyoq5depjonv4xizlyoq");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.plain-text");
      expect(typeObj.description).assertEqual("");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mytext");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850 end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0860
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860
     * @tc.desc      : parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".mytext"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mytext");
      let typeObj = UTD.getTypeDescriptor(result);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("flex.zh45depjonv4xizlyoq");
      expect(typeObj.belongingToTypes.toString()).assertEqual("");
      expect(typeObj.description).assertEqual("");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mytext");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860 end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0870
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870
     * @tc.desc      : parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".mytext","general.cumtomType"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.cumtomType");
        if (result) {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message} `);
        expect(error.code).assertEqual("401");
      }
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870 end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0880
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880
     * @tc.desc      : Dynamic type acquisition
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880 start');
      let result = UTD.getUniformDataTypeByMIMEType(".mytext", "general.plain-text");
      let typeObj = UTD.getTypeDescriptor(result);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("flex.zh4yd2z3fnzsxeylmfzygyyljnywxizlyoq5dcpjonv4xizlyoq");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.plain-text");
      expect(typeObj.description).assertEqual("");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual(".mytext");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0890
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890
     * @tc.desc      : Dynamic type acquisition
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890 start');
      let result = UTD.getUniformDataTypeByMIMEType("g");
      let typeObj = UTD.getTypeDescriptor(result);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("flex.zh45dcplh");
      expect(typeObj.belongingToTypes.toString()).assertEqual("");
      expect(typeObj.description).assertEqual("");
      expect(typeObj.referenceURL).assertEqual("");
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("g");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0910
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910
     * @tc.desc      : parameter to getUniformDataTypeByMIMEType()  --parameter is ".mytext","general.cumtomType"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType(".mytext", "general.cumtomType");
        if (result) {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message} `);
        expect(error.code).assertEqual("401");
      }
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910 end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0920
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920
     * @tc.desc      : Dynamic type acquisition parameter to isLowerLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj1 = UTD.getTypeDescriptor(result);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0930
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930
     * @tc.desc      : Dynamic type acquisition parameter to isLowerLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj1 = UTD.getTypeDescriptor(result);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.HTML);
        console.log("result==>" + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0940
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940
     * @tc.desc      : Dynamic type acquisition parameter to isLowerLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      let result2 = UTD.getUniformDataTypeByFilenameExtension(".texcl");
      try {
        let result = typeObj1.isLowerLevelType(result2);
        console.log("result==>" + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950
     * @tc.desc      : Dynamic type acquisition parameter to isHigherLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      let result2 = UTD.getUniformDataTypeByFilenameExtension(".texcl");
      try {
        let result = typeObj1.isHigherLevelType(result2);
        console.log("result==>" + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0960
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960
     * @tc.desc      : Dynamic type acquisition parameter to isHigherLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.object");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.TEXT);
        console.log("result==>" + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0970
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970
     * @tc.desc      : Dynamic type acquisition parameter to belongsTo()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.belongsTo('general.object');
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980
     * @tc.desc      : Dynamic type acquisition parameter to belongsTo()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.belongsTo('general.plain-text');
        console.log("result==>" + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0990
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990
     * @tc.desc      : Dynamic type acquisition parameter to belongsTo()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      let result2 = UTD.getUniformDataTypeByFilenameExtension(".myexel", "general.plain-text");
      try {
        let result = typeObj1.belongsTo(result2);
        console.log("result==>" + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to belongsTo()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.belongsTo("general.hello");
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to isHigherLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isHigherLevelType("general.hello");
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1030
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to isLowerLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isLowerLevelType("general.hello");
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1040
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to belongsTo()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.belongsTo("");
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to isHigherLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isHigherLevelType("");
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to isLowerLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isLowerLevelType("");
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1070
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to belongsTo()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1070 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.belongsTo(null);
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1070 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1080
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to isHigherLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1080 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isHigherLevelType(null);
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1080 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1090
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to isLowerLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1090 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isLowerLevelType(null);
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1090 end");
    });


    /**
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1110
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to belongsTo()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1110 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.belongsTo(undefined);
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1110 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1120
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to isHigherLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1120 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isHigherLevelType(undefined);
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1120 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1130
     * @tc.desc      : Dynamic vs. Illegal Types  parameter to isLowerLevelType()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1130 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        let result = typeObj1.isLowerLevelType(undefined);
        console.log("result==>" + result);
        expect(result).assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual("401");
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1130 end");
    });


    /**
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830
     * @tc.desc      : getUniformDataTypeByMIMEType --Fuzzy queries parameter --text/*
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("text/*");

        console.log("result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.TEXT);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }

      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810 end");
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2410
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410
     * @tc.desc      : Verify the properties of the xhtml file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410 start');
      expect(UTD.UniformDataType.XHTML).assertEqual("general.xhtml");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.XHTML);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.xhtml");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.xml");
      expect(typeObj.description).assertEqual("XHTML");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".xhtml");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/xhtml+xml");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420
     * @tc.desc      : Verify the properties of the rss file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420 start');
      expect(UTD.UniformDataType.RSS).assertEqual("general.rss");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RSS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.rss");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.xml");
      expect(typeObj.description).assertEqual("Rich site summary");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".rss");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/rss+xml");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430
     * @tc.desc      : Verify the properties of the css file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430 start');
      expect(UTD.UniformDataType.CSS).assertEqual("general.css");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CSS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.css");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.script");
      expect(typeObj.description).assertEqual("Cascading style sheets");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".css");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/css");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440
     * @tc.desc      : Verify the properties of the tex file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440 start');
      expect(UTD.UniformDataType.TEX).assertEqual("general.tex");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TEX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.tex");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("Base type for TeX source code");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450
     * @tc.desc      : Verify the properties of the asc-text file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450 start');
      expect(UTD.UniformDataType.ASC_TEXT).assertEqual("general.asc-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ASC_TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.asc-text");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.text");
      expect(typeObj.description).assertEqual("ASCII text file");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".asc");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/plain");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450
     * @tc.desc      : Verify the properties of the rich-text file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2460 start');
      expect(UTD.UniformDataType.RICH_TEXT).assertEqual("general.rich-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RICH_TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.rich-text");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Rich text format file");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".rtf,.rtx");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/rtf,text/richtext");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2460 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470
     * @tc.desc      : Verify the properties of the delimited-values-text file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470 start');
      expect(UTD.UniformDataType.DELIMITED_VALUES_TEXT).assertEqual("general.delimited-values-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DELIMITED_VALUES_TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.delimited-values-text");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Base type for delimited-values text");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480
     * @tc.desc      : Verify the properties of the comma-separated-values-tex file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480 start');
      expect(UTD.UniformDataType.COMMA_SEPARATED_VALUES_TEXT).assertEqual('general.comma-separated-values-text');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.COMMA_SEPARATED_VALUES_TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.comma-separated-values-text');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.delimited-values-text");
      expect(typeObj.description).assertEqual("Comma-separated values file");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".csv");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/csv");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2490
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2490
     * @tc.desc      : Verify the properties of the tab-separated-values-text file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2490 start');
      expect(UTD.UniformDataType.TAB_SEPARATED_VALUES_TEXT).assertEqual("general.tab-separated-values-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TAB_SEPARATED_VALUES_TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual("general.tab-separated-values-text");
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.delimited-values-text");
      expect(typeObj.description).assertEqual("Tab-Separated values file");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".tsv");
      expect(typeObj.mimeTypes.toString()).assertEqual("text/tab-separated-values");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510
     * @tc.desc      : Verify the properties of the gif file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510 start');
      expect(UTD.UniformDataType.GIF).assertEqual('general.gif');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GIF);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.gif');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.image");
      expect(typeObj.description).assertEqual("GIF image");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".gif");
      expect(typeObj.mimeTypes.toString()).assertEqual("image/gif");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2520
     * @tc.desc      : Verify the properties of the com.microsoft.word.dot file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510 start');
      expect(UTD.UniformDataType.WORD_DOT).assertEqual('com.microsoft.word.dot');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORD_DOT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('com.microsoft.word.dot');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft Word document template");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".dot");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/msword");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2530
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530
     * @tc.desc      : Verify the properties of the com.microsoft.powerpoint.pps file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530 start');
      expect(UTD.UniformDataType.POWERPOINT_PPS).assertEqual('com.microsoft.powerpoint.pps');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POWERPOINT_PPS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('com.microsoft.powerpoint.pps');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft PowerPoint slide show");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".pps");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-powerpoint");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540
     * @tc.desc      : Verify the properties of the com.microsoft.powerpoint.pot file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540 start');
      expect(UTD.UniformDataType.POWERPOINT_POT).assertEqual('com.microsoft.powerpoint.pot');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POWERPOINT_POT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('com.microsoft.powerpoint.pot');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft PowerPoint Template");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".pot");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-powerpoint");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550
     * @tc.desc      : Verify the properties of the com.microsoft.excel.xlt file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550 start');
      expect(UTD.UniformDataType.EXCEL_XLT).assertEqual('com.microsoft.excel.xlt');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EXCEL_XLT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('com.microsoft.excel.xlt');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft Excel spreadsheet template");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".xlt");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-excel");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2560
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560
     * @tc.desc      : Verify the properties of the com.microsoft.visio.vsd file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560 start');
      expect(UTD.UniformDataType.VISIO_VSD).assertEqual('com.microsoft.visio.vsd');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VISIO_VSD);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('com.microsoft.visio.vsd');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft Office Visio 2003-2010 drawing");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".vsd");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.visio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570
     * @tc.desc      : Verify the properties of the ts file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570 start');
      expect(UTD.UniformDataType.TS).assertEqual('general.ts');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TS);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.ts');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video");
      expect(typeObj.description).assertEqual("MPEG transport stream");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ts");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/mp2ts,video/mp2t");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2580
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580
     * @tc.desc      : Verify the properties of the mpegurl-video file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580 start');
      expect(UTD.UniformDataType.MPEGURL_VIDEO).assertEqual('general.mpegurl-video');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEGURL_VIDEO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.mpegurl-video');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Video playlist");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mxu,.m4u");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/vnd.mpegurl");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2590
     * @tc.desc      : Verify the properties of the org.matroska.mkv file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580 start');
      expect(UTD.UniformDataType.MATROSKA_VIDEO).assertEqual('org.matroska.mkv');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MATROSKA_VIDEO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.matroska.mkv');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Matroska video");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mkv");
      expect(typeObj.mimeTypes.toString()).assertEqual("video/x-matroska");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610
     * @tc.desc      : Verify the properties of the com.adobe.flash file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610 start');
      expect(UTD.UniformDataType.FLASH).assertEqual('com.adobe.flash');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FLASH);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('com.adobe.flash');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Shockwave flash movie");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".swf,.flv");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-shockwave-flash,video/x-flv");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2620
     * @tc.desc      : Verify the properties of the general.mpegurl-audio file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610 start');
      expect(UTD.UniformDataType.MPEGURL_AUDIO).assertEqual('general.mpegurl-audio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEGURL_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.mpegurl-audio');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Audio playlist");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".m3u");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/mpegurl,audio/x-mpegurl");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630
     * @tc.desc      : Verify the properties of the general.mpeg-4-audio file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630 start');
      expect(UTD.UniformDataType.MPEG_4_AUDIO).assertEqual('general.mpeg-4-audio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG_4_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.mpeg-4-audio');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Audio-only MPEG-4 file");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".m4a,.m4b");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/mpeg");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650
     * @tc.desc      : Verify the properties of the mp2 file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650 start');
      expect(UTD.UniformDataType.MP2).assertEqual('general.mp2');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MP2);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.mp2');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("MPEG-1 audio layer II or MPEG-2 audio layer II");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mp2");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/mpeg");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640
     * @tc.desc      : Verify the properties of the mpeg-audio file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640 start');
      expect(UTD.UniformDataType.MPEG_AUDIO).assertEqual('general.mpeg-audio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.mpeg-audio');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("MPEG audio format");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mpga");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/mpeg");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660
     * @tc.desc      : Verify the properties of the ulaw-audio file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660 start');
      expect(UTD.UniformDataType.ULAW_AUDIO).assertEqual('general.ulaw-audio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ULAW_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.ulaw-audio');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("uLaw audio");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".au,.ulw,.snd");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/basic,audio/au,audio/snd");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670
     * @tc.desc      : Verify the properties of the org.matroska.mka file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670 start');
      expect(UTD.UniformDataType.MATROSKA_AUDIO).assertEqual('org.matroska.mka');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MATROSKA_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.matroska.mka');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Matroska audio");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mka");
      expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-matroska");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2680
     * @tc.desc      : Verify the properties of the opg file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690 start');
      expect(UTD.UniformDataType.OPG).assertEqual('general.opg');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.opg');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("OPG archive");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".opg");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690
     * @tc.desc      : Verify the properties of the taz-archive file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690 start');
      expect(UTD.UniformDataType.TAZ_ARCHIVE).assertEqual('general.taz-archive');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TAZ_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.taz-archive');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.tar-archive");
      expect(typeObj.description).assertEqual("Tar zipped file");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".taz,.tar.z,.tz");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-gtar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710
     * @tc.desc      : Verify the properties of the web-archive file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710 start');
      expect(UTD.UniformDataType.WEB_ARCHIVE).assertEqual('general.web-archive');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WEB_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.web-archive');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("MHTML web archive");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".mht,.mhtml");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-mimearchive");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720
     * @tc.desc      : Verify the properties of the iso file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720 start');
      expect(UTD.UniformDataType.ISO).assertEqual('general.iso');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ISO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.iso');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.disk-image");
      expect(typeObj.description).assertEqual("Disc image file");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".iso");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-iso9660-image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730
     * @tc.desc      : Verify the properties of the org.openxmlformats.drawingml.visio file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730 start');
      expect(UTD.UniformDataType.DRAWINGML_VISIO).assertEqual('org.openxmlformats.drawingml.visio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DRAWINGML_VISIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.openxmlformats.drawingml.visio');
      expect(typeObj.belongingToTypes.toString()).assertEqual("org.openxmlformats.openxml,general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft Visio drawing");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".vsdx");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("application/vnd.openxmlformats-officedocument.drawingml.drawing");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2740
     * @tc.desc      : Verify the properties of the org.openxmlformats.drawingml.template file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730 start');
      expect(UTD.UniformDataType.DRAWINGML_TEMPLATE).assertEqual('org.openxmlformats.drawingml.template');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DRAWINGML_TEMPLATE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.openxmlformats.drawingml.template');
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[0].toString()))
        .assertEqual(true);
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[1].toString()))
        .assertEqual(true);
      expect(typeObj.description).assertEqual("Microsoft Visio drawing template");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".vstx");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750
     * @tc.desc      : Verify the properties of the org.openxmlformats.wordprocessingml.template file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750 start');
      expect(UTD.UniformDataType.WORDPROCESSINGML_TEMPLATE).assertEqual('org.openxmlformats.wordprocessingml.template');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORDPROCESSINGML_TEMPLATE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.openxmlformats.wordprocessingml.template');
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[0].toString()))
        .assertEqual(true);
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[1].toString()))
        .assertEqual(true);
      expect(typeObj.description).assertEqual("Office Open XML document template.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".dotx");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("application/vnd.openxmlformats-officedocument.wordprocessingml.template");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2760
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760
     * @tc.desc      : Verify the properties of the org.openxmlformats.presentationml.template file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760 start');
      expect(UTD.UniformDataType.PRESENTATIONML_TEMPLATE).assertEqual('org.openxmlformats.presentationml.template');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PRESENTATIONML_TEMPLATE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.openxmlformats.presentationml.template');
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[0].toString()))
        .assertEqual(true);
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[1].toString()))
        .assertEqual(true);
      expect(typeObj.description).assertEqual("Office Open XML presentation template");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".potx");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("application/vnd.openxmlformats-officedocument.presentationml.template");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770
     * @tc.desc      : Verify the properties of the org.openxmlformats.presentationml.slideshow file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770 start');
      expect(UTD.UniformDataType.PRESENTATIONML_SLIDESHOW).assertEqual('org.openxmlformats.presentationml.slideshow');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PRESENTATIONML_SLIDESHOW);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.openxmlformats.presentationml.slideshow');
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[0].toString()))
        .assertEqual(true);
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[1].toString()))
        .assertEqual(true);
      expect(typeObj.description).assertEqual("Office Open XML slide show");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ppsx");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("application/vnd.openxmlformats-officedocument.presentationml.slideshow");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2780
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780
     * @tc.desc      : Verify the properties of the org.openxmlformats.spreadsheetml.template file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780 start');
      expect(UTD.UniformDataType.SPREADSHEETML_TEMPLATE).assertEqual('org.openxmlformats.spreadsheetml.template');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SPREADSHEETML_TEMPLATE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.openxmlformats.spreadsheetml.template');
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[0].toString()))
        .assertEqual(true);
      expect("general.composite-object,org.openxmlformats.openxml".includes(typeObj.belongingToTypes[1].toString()))
        .assertEqual(true);
      expect(typeObj.description).assertEqual("Office Open XML spreadsheet template");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".xltx");
      expect(typeObj.mimeTypes.toString())
        .assertEqual("application/vnd.openxmlformats-officedocument.spreadsheetml.template");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2790
     * @tc.desc      : Verify the properties of the com.rarlab.rar-archive file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780 start');
      expect(UTD.UniformDataType.RAR_ARCHIVE).assertEqual('com.rarlab.rar-archive');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RAR_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('com.rarlab.rar-archive');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("WinRAR compressed archive");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".rar");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/rar,application/vnd.rar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810
     * @tc.desc      : Verify the properties of the org.7-zip.7-zip-archive file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810 start');
      expect(UTD.UniformDataType.SEVEN_ZIP_ARCHIVE).assertEqual('org.7-zip.7-zip-archive');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SEVEN_ZIP_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('org.7-zip.7-zip-archive');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("7-zip compressed archive");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".7z");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/x-7z-compressed");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820
     * @tc.desc      : Verify the properties of the general.ofd file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820 start');
      expect(UTD.UniformDataType.OFD).assertEqual('general.ofd');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OFD);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.ofd');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Open fixed-layout document, a national standard for format documents");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual(".ofd");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830
     * @tc.desc      : Verify the properties of the general.cad file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830 start');
      expect(UTD.UniformDataType.CAD).assertEqual('general.cad');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CAD);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.cad');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for computer-aided design");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2840
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840
     * @tc.desc      : Verify the properties of the general.octet-stream file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840 start');
      expect(UTD.UniformDataType.OCTET_STREAM).assertEqual('general.octet-stream');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OCTET_STREAM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      console.log("filenameExtensions:" + typeObj.filenameExtensions.toString());
      console.log("mimeTypes:" + typeObj.mimeTypes.toString());
      expect(typeObj.typeId).assertEqual('general.octet-stream');
      expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Arbitrary binary data");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      expect(typeObj.filenameExtensions.toString()).assertEqual("");
      expect(typeObj.mimeTypes.toString()).assertEqual("application/octet-stream");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140
     * @tc.desc      : parameter to getUniformDataTypesByFilenameExtension()  --parameter is ".xls"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140 start');
      try {
        let result = UTD.getUniformDataTypesByFilenameExtension(".xls");
        console.log("result=====>" + JSON.stringify(result));
        expect(result[0]).assertEqual(UTD.UniformDataType.EXCEL)
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1150
     * @tc.desc      : Invalid parameter to getUniformDataTypesByFilenameExtension()  --parameter is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1150 start');
      try {
        let result = UTD.getUniformDataTypesByFilenameExtension(null);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1150 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160
     * @tc.desc      : Invalid parameter to getUniformDataTypesByFilenameExtension()  --parameter is ".hello"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160 start');
      try {
        let dynamicType = UTD.getUniformDataTypesByFilenameExtension(".hello");
        console.log("UDMF,result=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType[0]);
        console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
        console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
        console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
        console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
        expect(dynamicTypeObj.typeId).assertEqual(dynamicType[0]);
        expect(dynamicTypeObj.belongingToTypes.length).assertEqual(0);
        expect(dynamicTypeObj.filenameExtensions[0]).assertEqual(".hello");
        expect(dynamicTypeObj.mimeTypes.length).assertEqual(0);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170
     * @tc.desc      : Invalid parameter to getUniformDataTypesByFilenameExtension()  --parameter is ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170 start');
      try {
        let result = UTD.getUniformDataTypesByFilenameExtension("");
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180
     * @tc.desc      : Invalid parameter to getUniformDataTypesByFilenameExtension()  --parameter is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180 start');
      try {
        let result = UTD.getUniformDataTypesByFilenameExtension(undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190
     * @tc.desc      : parameter to getUniformDataTypesByMIMEType() --"image/tiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190 start');
      try {
        let result = UTD.getUniformDataTypesByMIMEType("image/tiff");
        console.log("result=====>" + result);
        expect(result[0] == "general.tiff").assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1210
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210
     * @tc.desc      : Invalid  parameter to getUniformDataTypesByMIMEType() --parameter is "hello"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210 start');
      try {
        let dynamicType = UTD.getUniformDataTypesByMIMEType("hello");
        console.log("dynamicType=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType[0]);
        console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
        console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
        console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
        console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
        expect(dynamicTypeObj.typeId).assertEqual(dynamicType[0]);
        expect(dynamicTypeObj.belongingToTypes.length).assertEqual(0);
        expect(dynamicTypeObj.mimeTypes[0]).assertEqual("hello");
        expect(dynamicTypeObj.filenameExtensions.length).assertEqual(0);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220
     * @tc.desc      : Invalid  parameter to getUniformDataTypesByMIMEType() --parameter is ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220 start');
      try {
        let result = UTD.getUniformDataTypesByMIMEType("");
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1230
     * @tc.desc      : Invalid  parameter to getUniformDataTypesByMIMEType() --parameter is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1230 start');
      try {
        let result = UTD.getUniformDataTypesByMIMEType(null);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1230 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1240
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1240
     * @tc.desc      : Invalid  parameter to getUniformDataTypesByMIMEType() --parameter is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1240 start');
      try {
        let result = UTD.getUniformDataTypesByMIMEType(undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1240 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250
     * @tc.desc      : parameter to getUniformDataTypesByMIMEType()  --parameter are "image/tiff" and "general.type-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250 start');
      try {
        let result = UTD.getUniformDataTypesByMIMEType("audio/x-ms-wma", UTD.UniformDataType.WINDOWS_MEDIA_WMA);
        console.log("result=====>" + result);
        expect(result[0] == UTD.UniformDataType.WINDOWS_MEDIA_WMA).assertEqual(true);
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1260
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1260
     * @tc.desc      : parameter to getTypeDescriptor()  --parameter are "igeneral.content-form"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1260 start');
      expect(UTD.UniformDataType.CONTENT_FORM).assertEqual("general.content-form");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CONTENT_FORM);
      console.log("typeId:" + typeObj.typeId);
      expect(typeObj.typeId).assertEqual("general.content-form");
    });

    /**
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270
     * @tc.desc      : parameter to getUniformDataTypesByFilenameExtension()  --parameter is ".xls"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270 start');
      try {
         let result = UTD.getUniformDataTypesByFilenameExtension(".rb", 'general.shell-script');
        console.log("result=====>" + JSON.stringify(result));
        expect(result[0]).assertEqual(UTD.UniformDataType.RUBY_SCRIPT)
      } catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270 end");
    });
  })
}
