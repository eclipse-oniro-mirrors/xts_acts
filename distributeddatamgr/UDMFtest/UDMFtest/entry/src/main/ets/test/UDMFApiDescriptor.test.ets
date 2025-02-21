/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import UTD from '@ohos.data.uniformTypeDescriptor'

const REFERENCE_URL = "https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis/js-apis-data-uniformTypeDescriptor.md#uniformdatatype";


export default function UDMFApiDescriptorTest() {
  describe('UDMFApiDescriptorTest',function () {
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100 start');
      expect(UTD.UniformDataType.TEXT).assertEqual("general.text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.text");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for all text.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0125
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125
     * @tc.desc      : Verify the properties of the entity type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125 start');
      expect(UTD.UniformDataType.ENTITY).assertEqual("general.entity");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.entity");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for physical hierarchy.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150
     * @tc.desc      : Verify the properties of the object type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150 start');
      expect(UTD.UniformDataType.OBJECT).assertEqual("general.object");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.object");
      expect(typeObj.belongingToTypes.length).assertEqual(0);
      expect(typeObj.description).assertEqual("Base type for logical hierarchy.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0175
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175
     * @tc.desc      : Verify the properties of the composite-object type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175 start');
      expect(UTD.UniformDataType.COMPOSITE_OBJECT).assertEqual("general.composite-object");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.COMPOSITE_OBJECT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.composite-object");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description)
        .assertEqual("Base type for mixed object. For example, a PDF file contains both text and special formatting data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200
     * @tc.desc      : Verify the properties of the plain text data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200 start');
      expect(UTD.UniformDataType.PLAIN_TEXT).assertEqual("general.plain-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.plain-text");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Text of unspecified encoding, with no markup.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_txt");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300
     * @tc.desc      : Verify the properties of the html data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300 start');
      expect(UTD.UniformDataType.HTML).assertEqual("general.html");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.HTML);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.html");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("HTML text.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_html");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400
     * @tc.desc      : Verify the properties of the hyperlink data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400 start');
      expect(UTD.UniformDataType.HYPERLINK).assertEqual("general.hyperlink");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.HYPERLINK);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.hyperlink");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("Hyperlink.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500
     * @tc.desc      : Verify the properties of the xml data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500 start');
      expect(UTD.UniformDataType.XML).assertEqual("general.xml");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.XML);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.xml");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
      expect(typeObj.description).assertEqual("XML text.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_xml");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600
     * @tc.desc      : Verify the properties of the Source code data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600 start');
      expect(UTD.UniformDataType.SOURCE_CODE).assertEqual("general.source-code");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SOURCE_CODE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.source-code");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.plain-text");
      expect(typeObj.description).assertEqual("Generic source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700
     * @tc.desc      : Verify the properties of the Script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700 start');
      expect(UTD.UniformDataType.SCRIPT).assertEqual("general.script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("Base type for scripting language source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800
     * @tc.desc      : Verify the properties of the Shell script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800 start');
      expect(UTD.UniformDataType.SHELL_SCRIPT).assertEqual("general.shell-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SHELL_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.shell-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.script");
      expect(typeObj.description).assertEqual("Shell script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900
     * @tc.desc      : Verify the properties of the C-shell script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900 start');
      expect(UTD.UniformDataType.CSH_SCRIPT).assertEqual("general.csh-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CSH_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.csh-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("C-shell script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000
     * @tc.desc      : Verify the properties of the Perl script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000 start');
      expect(UTD.UniformDataType.PERL_SCRIPT).assertEqual("general.perl-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PERL_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.perl-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Perl script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100
     * @tc.desc      : Verify the properties of the PHP script data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100 start');
      expect(UTD.UniformDataType.PHP_SCRIPT).assertEqual("general.php-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PHP_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.php-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("PHP script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200
     * @tc.desc      : Verify the properties of the Python script data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200 start');
      expect(UTD.UniformDataType.PYTHON_SCRIPT).assertEqual("general.python-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PYTHON_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.python-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Python script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300
     * @tc.desc      : Verify the properties of the Ruby script data type.
     * @tc.size      : MediumTest    
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300 start');
      expect(UTD.UniformDataType.RUBY_SCRIPT).assertEqual("general.ruby-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RUBY_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.ruby-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.shell-script");
      expect(typeObj.description).assertEqual("Ruby script.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400
     * @tc.desc      : Verify the properties of the TypeScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400 start');
      expect(UTD.UniformDataType.TYPE_SCRIPT).assertEqual("general.type-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TYPE_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.type-script");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("TypeScript source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500
     * @tc.desc      : Verify the properties of the JavaScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500 start');
      expect(UTD.UniformDataType.JAVA_SCRIPT).assertEqual("general.java-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_SCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.java-script");
      expect(typeObj.description).assertEqual("JavaScript source code.");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600
     * @tc.desc      : Verify the properties of the JavaScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600 start');
      expect(UTD.UniformDataType.C_HEADER).assertEqual("general.c-header");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_HEADER);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.c-header");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C header file.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700
     * @tc.desc      : Verify the properties of the C source code data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700 start');
      expect(UTD.UniformDataType.C_SOURCE).assertEqual("general.c-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_SOURCE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.c-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800
     * @tc.desc      : Verify the properties of the C++ header data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800 start');
      expect(UTD.UniformDataType.C_PLUS_PLUS_HEADER).assertEqual("general.c-plus-plus-header");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.c-plus-plus-header");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C++ header file.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest1900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900
     * @tc.desc      : Verify the properties of the C++ source code data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900 start');
      expect(UTD.UniformDataType.C_PLUS_PLUS_SOURCE).assertEqual("general.c-plus-plus-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.c-plus-plus-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("C++ source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000
     * @tc.desc      : Verify the properties of the C++ source code data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000 start');
      expect(UTD.UniformDataType.JAVA_SOURCE).assertEqual("general.java-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_SOURCE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.java-source");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.source-code");
      expect(typeObj.description).assertEqual("Java source code.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100
     * @tc.desc      : Verify the properties of the Ebook data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100 start');
      expect(UTD.UniformDataType.EBOOK).assertEqual("general.ebook");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EBOOK);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.ebook");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Base type for ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200
     * @tc.desc      : Verify the properties of the EPUB ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200 start');
      expect(UTD.UniformDataType.EPUB).assertEqual("general.epub");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EPUB);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.epub");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("Electronic publication (EPUB) format.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300
     * @tc.desc      : Verify the properties of the AZW ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300 start');
      expect(UTD.UniformDataType.AZW).assertEqual("com.amazon.azw");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AZW);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.amazon.azw");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("AZW ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400
     * @tc.desc      : Verify the properties of the AZW3 ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400 start');
      expect(UTD.UniformDataType.AZW3).assertEqual("com.amazon.azw3");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AZW3);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.amazon.azw3");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("AZW3 ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500
     * @tc.desc      : Verify the properties of the KFX ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500 start');
      expect(UTD.UniformDataType.KFX).assertEqual("com.amazon.kfx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.KFX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.amazon.kfx");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("KFX ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600
     * @tc.desc      : Verify the properties of the MOBI ebook file format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600 start');
      expect(UTD.UniformDataType.MOBI).assertEqual("com.amazon.mobi");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MOBI);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.amazon.mobi");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.ebook");
      expect(typeObj.description).assertEqual("MOBI ebook.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700
     * @tc.desc      : Verify the properties of the Media data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700 start');
      expect(UTD.UniformDataType.MEDIA).assertEqual("general.media");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MEDIA);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.media");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for media.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800
     * @tc.desc      : Verify the properties of the Image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800 start');
      expect(UTD.UniformDataType.IMAGE).assertEqual("general.image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for images.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest2900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900
     * @tc.desc      : Verify the properties of the JPEG image format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900 start');
      expect(UTD.UniformDataType.JPEG).assertEqual("general.jpeg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JPEG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.jpeg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("JPEG image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000
     * @tc.desc      : Verify the properties of the png image format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000 start');
      expect(UTD.UniformDataType.PNG).assertEqual("general.png");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PNG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.png");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("PNG image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100
     * @tc.desc      : Verify the properties of the Raw image format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100 start');
      expect(UTD.UniformDataType.RAW_IMAGE).assertEqual("general.raw-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RAW_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.raw-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Base type for digital camera raw image formats.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200
     * @tc.desc      : Verify the properties of the TIFF image format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200 start');
      expect(UTD.UniformDataType.TIFF).assertEqual("general.tiff");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TIFF);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.tiff");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("TIFF image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300
     * @tc.desc      : Verify the properties of the Windows bitmap image data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300 start');
      expect(UTD.UniformDataType.BMP).assertEqual("com.microsoft.bmp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.BMP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.bmp");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Windows bitmap image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400
     * @tc.desc      : Verify the properties of the Windows icon data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400 start');
      expect(UTD.UniformDataType.ICO).assertEqual("com.microsoft.ico");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ICO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.ico");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Windows icon image.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500
     * @tc.desc      : Verify the properties of the Adobe Photoshop document data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500 start');
      expect(UTD.UniformDataType.PHOTOSHOP_IMAGE).assertEqual("com.adobe.photoshop-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PHOTOSHOP_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.adobe.photoshop-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Adobe Photoshop document.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600
     * @tc.desc      : Verify the properties of the Adobe Illustrator document data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600 start');
      expect(UTD.UniformDataType.AI_IMAGE).assertEqual("com.adobe.illustrator.ai-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AI_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.adobe.illustrator.ai-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("Adobe Illustrator document.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700
     * @tc.desc      : Verify the properties of the Microsoft Word data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700 start');
      expect(UTD.UniformDataType.WORD_DOC).assertEqual("com.microsoft.word.doc");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORD_DOC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.word.doc");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft Word data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_doc");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800
     * @tc.desc      : Verify the properties of the Microsoft Excel data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800 start');
      expect(UTD.UniformDataType.EXCEL).assertEqual("com.microsoft.excel.xls");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EXCEL);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.excel.xls");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft Excel data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_xls");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest3900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900
     * @tc.desc      : Verify the properties of the Microsoft PowerPoint presentation data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900 start');
      expect(UTD.UniformDataType.PPT).assertEqual("com.microsoft.powerpoint.ppt");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.powerpoint.ppt");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("Microsoft PowerPoint presentation.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000
     * @tc.desc      : Verify the properties of the PDF data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000 start');
      expect(UTD.UniformDataType.PDF).assertEqual("com.adobe.pdf");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PDF);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.adobe.pdf");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("PDF data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_pdf");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100
     * @tc.desc      : Verify the properties of the PostScript data type
     * @tc.size      : MediumTest    
      * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100 start');
      expect(UTD.UniformDataType.POSTSCRIPT).assertEqual("com.adobe.postscript");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.adobe.postscript");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
      expect(typeObj.description).assertEqual("PostScript data.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200
     * @tc.desc      : Verify the properties of the Encapsulated PostScript data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200 start');
      expect(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT).assertEqual("com.adobe.encapsulated-postscript");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.adobe.encapsulated-postscript");
      expect(typeObj.belongingToTypes[0]).assertEqual("com.adobe.postscript");
      expect(typeObj.description).assertEqual("Encapsulated PostScript.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300
     * @tc.desc      : Verify the properties of the Video data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300 start');
      expect(UTD.UniformDataType.VIDEO).assertEqual("general.video");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.video");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400
     * @tc.desc      : Verify the properties of the AVI video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400 start');
      expect(UTD.UniformDataType.AVI).assertEqual("general.avi");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AVI);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.avi");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("AVI video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500
     * @tc.desc      : Verify the properties of the MPEG video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500 start');
      expect(UTD.UniformDataType.MPEG).assertEqual("general.mpeg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.mpeg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("MPEG-1 or MPEG-2 video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600
     * @tc.desc      : Verify the properties of the MPEG4 video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600 start');
      expect(UTD.UniformDataType.MPEG4).assertEqual("general.mpeg-4");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG4);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.mpeg-4");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("MPEG-4 video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700
     * @tc.desc      : Verify the properties of the 3GPP video format data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700 start');
      expect(UTD.UniformDataType.VIDEO_3GPP).assertEqual("general.3gpp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO_3GPP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.3gpp");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("3GPP video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800
     * @tc.desc      : Verify the properties of the 3GPP video format data type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800 start');
      expect(UTD.UniformDataType.VIDEO_3GPP2).assertEqual("general.3gpp2");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO_3GPP2);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.3gpp2");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("3GPP2 video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest4900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900
     * @tc.desc      : Verify the properties of the Windows WM video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WM).assertEqual("com.microsoft.windows-media-wm");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wm");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Windows WM video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000
     * @tc.desc      : Verify the properties of the Windows WMV video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMV).assertEqual("com.microsoft.windows-media-wmv");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmv");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Windows WMV video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100
     * @tc.desc      : Verify the properties of the Windows WMP video format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMP).assertEqual("com.microsoft.windows-media-wmp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmp");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Windows WMP video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200
     * @tc.desc      : Verify the properties of the Audio data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200 start');
      expect(UTD.UniformDataType.AUDIO).assertEqual("general.audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.audio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
      expect(typeObj.description).assertEqual("Base type for audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300
     * @tc.desc      : Verify the properties of the AAC audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300 start');
      expect(UTD.UniformDataType.AAC).assertEqual("general.aac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AAC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.aac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("AAC audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400
     * @tc.desc      : Verify the properties of the AIFF audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400 start');
      expect(UTD.UniformDataType.AIFF).assertEqual("general.aiff");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AIFF);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.aiff");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("AIFF audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500
     * @tc.desc      : Verify the properties of the ALAC audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500 start');
      expect(UTD.UniformDataType.ALAC).assertEqual("general.alac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ALAC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.alac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("ALAC audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600
     * @tc.desc      : Verify the properties of the FLAC audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600 start');
      expect(UTD.UniformDataType.FLAC).assertEqual("general.flac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FLAC);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.flac");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("FLAC audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_flac");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700
     * @tc.desc      : Verify the properties of the MP3 audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700 start');
      expect(UTD.UniformDataType.MP3).assertEqual("general.mp3");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MP3);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.mp3");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("MPEG-3 audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_mp3");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800
     * @tc.desc      : Verify the properties of the OGG audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800 start');
      expect(UTD.UniformDataType.OGG).assertEqual("general.ogg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OGG);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.ogg");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("OGG audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest5900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900
     * @tc.desc      : Verify the properties of the PCM audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900 start');
      expect(UTD.UniformDataType.PCM).assertEqual("general.pcm");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PCM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.pcm");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("PCM audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000
     * @tc.desc      : Verify the properties of the Windows WMA audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMA).assertEqual("com.microsoft.windows-media-wma");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wma");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Windows WMA audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_wma");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100
     * @tc.desc      : Verify the properties of the Waveform audio format data type created by Microsoft
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100 start');
      expect(UTD.UniformDataType.WAVEFORM_AUDIO).assertEqual("com.microsoft.waveform-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WAVEFORM_AUDIO);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.waveform-audio");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Waveform audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_wav");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200
     * @tc.desc      : Verify the properties of the Windows WMX audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMX).assertEqual("com.microsoft.windows-media-wmx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmx");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Windows WMX video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300
     * @tc.desc      : Verify the properties of the Windows WVX audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WVX).assertEqual("com.microsoft.windows-media-wvx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WVX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wvx");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
      expect(typeObj.description).assertEqual("Windows WVX video.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400
     * @tc.desc      : Verify the properties of the Windows WAX audio format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WAX).assertEqual("com.microsoft.windows-media-wax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WAX);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wax");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
      expect(typeObj.description).assertEqual("Windows WAX audio.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500
     * @tc.desc      : Verify the properties of the File data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500 start');
      expect(UTD.UniformDataType.FILE).assertEqual("general.file");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FILE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.file");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
      expect(typeObj.description).assertEqual("Base type for file.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600
     * @tc.desc      : Verify the properties of the Directory data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600 start');
      expect(UTD.UniformDataType.DIRECTORY).assertEqual("general.directory");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DIRECTORY);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.directory");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
      expect(typeObj.description).assertEqual("Base type for directory.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_folder");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700
     * @tc.desc      : Verify the properties of the Folder data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700 start');
      expect(UTD.UniformDataType.FOLDER).assertEqual("general.folder");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FOLDER);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.folder");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.directory");
      expect(typeObj.description).assertEqual("Base type for folder.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_folder");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800
     * @tc.desc      : Verify the properties of the Symlink data type
     * @tc.size      : MediumTest    
      * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800 start');
      expect(UTD.UniformDataType.SYMLINK).assertEqual("general.symlink");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SYMLINK);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.symlink");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
      expect(typeObj.description).assertEqual("Base type for symlink.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest6900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900
     * @tc.desc      : Verify the properties of the Symlink data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900 start');
      expect(UTD.UniformDataType.ARCHIVE).assertEqual("general.archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for an archive of files and directories.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000
     * @tc.desc      : Verify the properties of the Bzip2 archive file data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000 start');
      expect(UTD.UniformDataType.BZ2_ARCHIVE).assertEqual("general.bz2-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.BZ2_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.bz2-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("BZip2 archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100
     * @tc.desc      : Verify the properties of the Disk image archive file data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100 start');
      expect(UTD.UniformDataType.DISK_IMAGE).assertEqual("general.disk-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DISK_IMAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.disk-image");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Base type for items mountable as a volume.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200
     * @tc.desc      : Verify the properties of the Tar archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200 start');
      expect(UTD.UniformDataType.TAR_ARCHIVE).assertEqual("general.tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TAR_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Tar archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300
     * @tc.desc      : Verify the properties of the Zip archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300 start');
      expect(UTD.UniformDataType.ZIP_ARCHIVE).assertEqual("general.zip-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ZIP_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.zip-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Zip archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_zip");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400
     * @tc.desc      : Verify the properties of the Java archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400 start');
      expect(UTD.UniformDataType.JAVA_ARCHIVE).assertEqual("com.sun.java-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("com.sun.java-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Java archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500
     * @tc.desc      : Verify the properties of the GNU archive data type
     * @tc.size      : MediumTest    
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500 start');
      expect(UTD.UniformDataType.GNU_TAR_ARCHIVE).assertEqual("org.gnu.gnu-tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_TAR_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("GNU archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600
     * @tc.desc      : Verify the properties of the Gzip archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600 start');
      expect(UTD.UniformDataType.GNU_ZIP_ARCHIVE).assertEqual("org.gnu.gnu-zip-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_ZIP_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-zip-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Gzip archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700
     * @tc.desc      : Verify the properties of the Gzip tar archive data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700 start');
      expect(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE).assertEqual("org.gnu.gnu-zip-tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("org.gnu.gnu-zip-tar-archive");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
      expect(typeObj.description).assertEqual("Gzip tar archive.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800
     * @tc.desc      : Verify the properties of the Calendar data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800 start');
      expect(UTD.UniformDataType.CALENDAR).assertEqual("general.calendar");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CALENDAR);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.calendar");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for scheduled events.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_calendar");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest7900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900
     * @tc.desc      : Verify the properties of the Contact data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900 start');
      expect(UTD.UniformDataType.CONTACT).assertEqual("general.contact");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.contact");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for contact information.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000
     * @tc.desc      : Verify the properties of the Database data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000 start');
      expect(UTD.UniformDataType.DATABASE).assertEqual("general.database");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DATABASE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.database");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for databases.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100
     * @tc.desc      : Verify the properties of the Message data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100 start');
      expect(UTD.UniformDataType.MESSAGE).assertEqual("general.message");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.message");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for messages.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200
     * @tc.desc      : Verify the properties of the vcard format data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200 start');
      expect(UTD.UniformDataType.VCARD).assertEqual("general.vcard");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VCARD);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.vcard");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for electronic business card.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300
     * @tc.desc      : Verify the properties of the navigation data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300 start');
      expect(UTD.UniformDataType.NAVIGATION).assertEqual("general.navigation");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.navigation");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("Base type for navigation.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400
     * @tc.desc      : Verify the properties of the Location data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400 start');
      expect(UTD.UniformDataType.LOCATION).assertEqual("general.location");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("general.location");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.navigation");
      expect(typeObj.description).assertEqual("Navigation location.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500
     * @tc.desc      : Verify the properties of the openharmony.form  data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500 start');
      expect(UTD.UniformDataType.OPENHARMONY_FORM).assertEqual("openharmony.form");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_FORM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("openharmony.form");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined form.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600
     * @tc.desc      : Verify the properties of the openharmony.app-item  data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600 start');
      expect(UTD.UniformDataType.OPENHARMONY_APP_ITEM).assertEqual("openharmony.app-item");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_APP_ITEM);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("openharmony.app-item");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined app item.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700
     * @tc.desc      : Verify the properties of the openharmony.pixel-map data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700 start');
      expect(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP).assertEqual("openharmony.pixel-map");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("openharmony.pixel-map");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
      expect(typeObj.description).assertEqual("OpenHarmony system defined pixel map.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800
     * @tc.desc      : Verify the properties of the openharmony.atomic-service data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800 start');
      expect(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE).assertEqual("openharmony.atomic-service");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("openharmony.atomic-service");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
      expect(typeObj.description).assertEqual("OpenHarmony system defined atomic service.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8825
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825
     * @tc.desc      : Verify the properties of the openharmony.package data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825 start');
      expect(UTD.UniformDataType.OPENHARMONY_PACKAGE).assertEqual("openharmony.package");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PACKAGE);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("openharmony.package");
      expect(typeObj.belongingToTypes[0]).assertEqual("general.directory");
      expect(typeObj.description)
        .assertEqual("OpenHarmony system defined package (that is, a directory presented to the user as a file).");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850
     * @tc.desc      : Verify the properties of the openharmony.hap data type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850 start');
      expect(UTD.UniformDataType.OPENHARMONY_HAP).assertEqual("openharmony.hap");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HAP);
      console.log("typeId:" + typeObj.typeId);
      console.log("belongingToTypes:" + typeObj.belongingToTypes);
      console.log("description:" + typeObj.description);
      console.log("referenceURL:" + typeObj.referenceURL);
      console.log("iconFile:" + typeObj.iconFile);
      expect(typeObj.typeId).assertEqual("openharmony.hap");
      expect(typeObj.belongingToTypes[0]).assertEqual("openharmony.package");
      expect(typeObj.description).assertEqual("OpenHarmony system defined ability package.");
      expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
      expect(typeObj.iconFile).assertEqual("");
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest8900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900
     * @tc.desc      : Illegal parameters null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900 start');
      try {
        let typeObj = UTD.getTypeDescriptor(null);
        console.log('typeObj start' + typeObj);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9000 start');
      try {
        let typeObj = UTD.getTypeDescriptor(undefined);
        console.log('typeObj start' + typeObj);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100 start');
      try {
        let typeObj = UTD.getTypeDescriptor("general.hello");
        console.log('typeObj start' + typeObj);
        if (typeObj == null) {
          console.log("Illegal parameters general.hello is :" + (typeObj == null));
        }
        expect(typeObj == null).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200 start');
      try {
        let typeObj = UTD.getTypeDescriptor("");
        console.log('typeObj start' + typeObj);
        expect(typeObj == null).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300 start');
      try {
        let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        let result = typeObj1.equals(typeObj2);
        expect(result == true).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400 start');
      try {
        let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
        let result = typeObj1.equals(typeObj2);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9500 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      let typeObj2 = null;
      try {
        let result = typeObj1.equals(typeObj2);
        console.log("result" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9600 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      let typeObj2 = undefined;
      try {
        let result = typeObj1.equals(typeObj2);
        console.log("result" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.NAVIGATION);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.LOCATION);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CALENDAR);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.CALENDAR);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.TEXT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
      try {
        let result = typeObj1.belongsTo("");
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9650', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9650 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      try {
        let result = typeObj1.belongsTo(null);
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9655', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9655 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.IMAGE);
      try {
        let result = typeObj1.belongsTo(undefined);
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.belongsTo("general.hello");
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.NAVIGATION);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.LOCATION);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.COMPOSITE_OBJECT);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.COMPOSITE_OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.TEXT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType("");
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType("general.hello");
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType(null);
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isLowerLevelType(undefined);
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.NAVIGATION);
        console.log("result==>" + result);
        expect(result == true).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.LOCATION);
        console.log("result==>" + result);
        expect(result == true).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.C_HEADER);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.C_HEADER);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.MESSAGE);
        console.log("result==>" + result);
        expect(result == false).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      try {
        let result = typeObj1.isHigherLevelType("");
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.TEXT);
      try {
        let result = typeObj1.isHigherLevelType("general.hello");
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      try {
        let result = typeObj1.isHigherLevelType(null);
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        let result = typeObj1.isHigherLevelType(undefined);
        console.log("result==>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".xls");
        console.log("result=====>" + result);
        expect(result == UTD.UniformDataType.EXCEL).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(null);
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".hello");
        console.log("result=====>" + result);
        expect(result == null).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension("");
        console.log("result=====>" + result);
        expect(result == null).assertEqual(true);
      }
      catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9795
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9795
     * @tc.desc      : Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameter is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9795', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9795 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".doc", UTD.UniformDataType.WORD_DOC);
        console.log("result=====>" + result);
        expect(result == UTD.UniformDataType.WORD_DOC).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".doc", UTD.UniformDataType.PPT);
        console.log("result=====>" + result);
        expect(result == null).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9815', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9815 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", null);
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9820', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9820 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".hello", UTD.UniformDataType.ICO);
        console.log("result=====>" + result);
        expect(result == null).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", "");
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff");
        console.log("result=====>" + result);
        expect(result == "general.tiff").assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("hello");
        console.log("result=====>" + result);
        expect(result == null).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("");
        console.log("result=====>" + result);
        expect(result == null).assertEqual(true);
      }
      catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845 end");
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUniformTypeDescriptorJsAPITest9850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9850
     * @tc.desc      : Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9850', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9850 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType(null);
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9855', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9855 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType(undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("audio/x-ms-wma", UTD.UniformDataType.WINDOWS_MEDIA_WMA);
        console.log("result=====>" + result);
        expect(result == UTD.UniformDataType.WINDOWS_MEDIA_WMA).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", UTD.UniformDataType.TYPE_SCRIPT);
        console.log("result=====>" + result);
        expect(result == null).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9870', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9870 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", null);
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9875', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9875 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", undefined);
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("hello", UTD.UniformDataType.WINDOWS_MEDIA_WMV);
        console.log("result=====>" + result);
        expect(result == null).assertEqual(true);
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", "general.hello");
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff", "");
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
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
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810', 0, function () {
      console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", "general.hello");
        console.log("result=====>" + result);
        expect().assertFail();
      }
      catch (err) {
        console.log("err message:" + err.message + ";err code:" + err.code);
        expect(err.code == "401").assertEqual(true);
      }
      console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9815 end");
    });
  })
}
