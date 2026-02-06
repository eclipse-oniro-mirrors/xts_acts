/*
 * Copyright (C) 2023-2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '../../../hypium/index'
import hilog from '@ohos.hilog'
import UTD from '@ohos.data.uniformTypeDescriptor';
import { BusinessError } from '@ohos.base';
import { unifiedDataChannel, uniformTypeDescriptor} from '@kit.ArkData';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
import { fileUri } from '@kit.CoreFileKit';
import { image } from '@kit.ImageKit';
let domain: int = 0x0000;

const REFERENCE_URL =
    "https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis/js-apis-data-uniformTypeDescriptor.md#uniformdatatype";
let tag = 'ttt:';
let TAG = "[ttt]"

export default function UDMFApiUtdUds() {
    describe('UDMFApiUtdUds', () => {
        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060
         * @tc.desc   Dynamic vs. Illegal Types  parameter to isLowerLevelType()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060 start');
            let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
            let typeObj1 = UTD.getTypeDescriptor(result1);
            if (typeObj1 != null) {
                try {
                    let result = typeObj1.isLowerLevelType("");
                    console.log("result==>" + result);
                    expect(result).assertFail();
                } catch (err) {
                    const error = err as BusinessError;
                    console.log("error message:" + error.message + ";error code:" + error.code);
                    expect(error.code).assertEqual(401);
                }
                console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060 end");
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050
         * @tc.desc   Dynamic vs. Illegal Types  parameter to isHigherLevelType()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050 start');
            let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
            let typeObj1 = UTD.getTypeDescriptor(result1);
            if (typeObj1 != null) {
                try {
                    let result = typeObj1.isHigherLevelType("");
                    console.log("result==>" + result);
                    expect(result).assertFail();
                } catch (err) {
                    const error = err as BusinessError;
                    console.log("error message:" + error.message + ";error code:" + error.code);
                    expect(error.code).assertEqual(401);
                }
                console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050 end");
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880
         * @tc.desc   Invalid  parameter to getUniformDataTypeByMIMEType() --parameter are invalid parameter "hello" and  UTD.UniformDataType.WINDOWS_MEDIA_WMV
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880 start');
            try {
                let dynamicType = UTD.getUniformDataTypeByMIMEType("hello", UTD.UniformDataType.WINDOWS_MEDIA_WMV);
                console.log("dynamicType=====>" + dynamicType);
                let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
                if (dynamicTypeObj != null) {
                    console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
                    console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
                    console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
                    console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
                    expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
                    expect(dynamicTypeObj.belongingToTypes[0]).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
                    expect(dynamicTypeObj.mimeTypes[0]).assertEqual("hello");
                    expect(dynamicTypeObj.filenameExtensions.length).assertEqual(0);
                }
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect().assertFail();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9880 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845
         * @tc.desc   Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845 start');
            try {
                let result = UTD.getUniformDataTypeByMIMEType("");
                console.log("result=====>" + result);
                expect().assertFail();
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect(error.code == 401).assertEqual(true);
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9845 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805
         * @tc.desc   Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are ".doc" and invalid parameter UTD.UniformDataType.PPT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805 start');
            try {
                let dynamicType = UTD.getUniformDataTypeByFilenameExtension(".doc", UTD.UniformDataType.PPT);
                console.log("result=====>" + dynamicType);
                let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
                if (dynamicTypeObj) {
                    console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
                    console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
                    console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
                    console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
                    expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
                    expect(dynamicTypeObj.belongingToTypes[0]).assertEqual(UTD.UniformDataType.PPT);
                    expect(dynamicTypeObj.filenameExtensions[0]).assertEqual(".doc");
                    expect(dynamicTypeObj.mimeTypes.length).assertEqual(0);
                }
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect().assertFail();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9805 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800
         * @tc.desc   parameter to getUniformDataTypeByFilenameExtension()  --parameters are ".doc" and UTD.UniformDataType.WORD_DOC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800 start');
            try {
                let result = UTD.getUniformDataTypeByFilenameExtension(".doc", UTD.UniformDataType.WORD_DOC);
                console.log("result=====>" + result);
                expect(result == (UTD.UniformDataType.WORD_DOC).toString()).assertEqual(true);
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect().assertFail();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9800 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785
         * @tc.desc   Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".hello"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785 start');
            try {
                let dynamicType = UTD.getUniformDataTypeByFilenameExtension(".hello");
                console.log("UDMF,result=====>" + dynamicType);
                let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
                if (dynamicTypeObj != null) {
                    console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
                    console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
                    console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
                    console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
                    expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
                    expect(dynamicTypeObj.belongingToTypes.length).assertEqual(0);
                    expect(dynamicTypeObj.filenameExtensions[0]).assertEqual(".hello");
                    expect(dynamicTypeObj.mimeTypes.length).assertEqual(0);
                }
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect().assertFail();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9785 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775
         * @tc.desc   parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".xls"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775 start');
            try {
                let result = UTD.getUniformDataTypeByFilenameExtension(".xls");
                console.log("result=====>" + result);
                expect(result == (UTD.UniformDataType.EXCEL).toString()).assertEqual(true);
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect().assertFail();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755
         * @tc.desc   Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and "".
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755 start');
            let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
            if (typeObj1 != null) {
                try {
                    let result = typeObj1.isHigherLevelType("");
                    console.log("result==>" + result);
                    expect().assertFail();
                } catch (err) {
                    const error = err as BusinessError;
                    console.log("error message:" + error.message + ";error code:" + error.code);
                    expect(error.code == 401).assertEqual(true);
                }
                console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9755 end");
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735
         * @tc.desc   parameter to isHigherLevelType() --The object of a parameter has a high-level relationship with the two levels below the parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735 start');
            let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
            if (typeObj1 != null) {
                try {
                    let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
                    console.log("result==>" + result);
                    expect(result == false).assertEqual(true);
                } catch (err) {
                    const error = err as BusinessError;
                    console.log("error message:" + error.message + ";error code:" + error.code);
                    expect().assertFail();
                }
                console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9735 end");
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700
         * @tc.desc   Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to "".
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700 start');
            let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
            if (typeObj1 != null) {
                try {
                    let result = typeObj1.isLowerLevelType("");
                    console.log("result==>" + result);
                    expect().assertFail();
                } catch (err) {
                    const error = err as BusinessError;
                    console.log("error message:" + error.message + ";error code:" + error.code);
                    expect(error.code == 401).assertEqual(true);
                }
                console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9700 end");
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675
         * @tc.desc   parameter to isLowerLevelType()  --The low-level relationship between the object of a parameter and the two levels above the parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675 start');
            let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
            if (typeObj1 != null) {
                try {
                    let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
                    console.log("result==>" + result);
                    expect(result).assertEqual(true);
                } catch (err) {
                    const error = err as BusinessError;
                    console.log("error message:" + error.message + ";error code:" + error.code);
                    expect().assertFail();
                }
                console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9675 end");
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670
         * @tc.desc   parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the next level of the parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670 start');
            let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
            if (typeObj1 != null) {
                try {
                    let result = typeObj1.isLowerLevelType(UTD.UniformDataType.NAVIGATION);
                    console.log("result==>" + result);
                    expect(result == false).assertEqual(true);
                } catch (err) {
                    const error = err as BusinessError;
                    console.log("error message:" + error.message + ";error code:" + error.code);
                    expect().assertFail();
                }
                console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9670 end");
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610
         * @tc.desc   parameters to belongsTo -- The relationship between the object of the parameter and the parent of the parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610 start');
            let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
            if (typeObj1 != null) {
                try {
                    let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
                    console.log("result==>" + result);
                    expect(result).assertEqual(true);
                } catch (err) {
                    const error = err as BusinessError;
                    console.log("error message:" + error.message + ";error code:" + error.code);
                    expect().assertFail();
                }
                console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9610 end");
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400
         * @tc.desc   Equals the different parameter types
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400 start');
            try {
                let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
                let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
                if (typeObj1 != null && typeObj2 != null) {
                    let result = typeObj1.equals(typeObj2);
                    expect(result == false).assertEqual(true);
                }
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect().assertFail();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9400 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200
         * @tc.desc   Illegal parameters ""
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200 start');
            try {
                let typeObj = UTD.getTypeDescriptor("");
                console.log('typeObj start' + typeObj);
                expect(typeObj == null).assertFail();
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect(error.code == 401).assertTrue();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9200 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100
         * @tc.desc   Illegal parameters general.hello
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
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
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect(error.code == 401).assertTrue();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9100 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840
         * @tc.desc   Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is "hello"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840 start');
            try {
                let dynamicType = UTD.getUniformDataTypeByMIMEType("hello");
                console.log("dynamicType=====>" + dynamicType);
                let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
                if (dynamicTypeObj != null) {
                    console.log("UDMF,typeId:" + dynamicTypeObj.typeId);
                    console.log("UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
                    console.log("UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
                    console.log("UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
                    expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
                    expect(dynamicTypeObj.belongingToTypes.length).assertEqual(0);
                    expect(dynamicTypeObj.mimeTypes[0]).assertEqual("hello");
                    expect(dynamicTypeObj.filenameExtensions.length).assertEqual(0);
                }
            } catch (err) {
                const error = err as BusinessError;
                console.log("error message:" + error.message + ";error code:" + error.code);
                expect().assertFail();
            }
            console.log("SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9840 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850
         * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850
         * @tc.desc   Verify the properties of the openharmony.hap data type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            console.log('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850 start');
            expect(UTD.UniformDataType.OPENHARMONY_HAP).assertEqual("openharmony.hap");
            let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HAP);
            if (typeObj != null) {
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
            }
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000
         * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000
         * @tc.desc   Verify the properties of the contentForm type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
            console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000 start');
            let options: unifiedDataChannel.Options = {
                intention: unifiedDataChannel.Intention.DATA_HUB
            };
            let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
            let arrayBuffer = new ArrayBuffer(4*200*200);
            let opt : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 200, width: 200 }, alphaType: image.AlphaType.UNPREMUL };
            let pixelMapDetails : Record<string, int | long | double | string | Uint8Array> = {
                'pixelMapKey1': 123,
                'pixelMapKey2': 'pixelMapValue',
                'pixelMapKey3': u8Array,
            }
            let pixelMap : uniformDataStruct.PixelMap = {
                uniformDataType : 'openharmony.pixel-map',
                pixelMap : image.createPixelMapSync(arrayBuffer, opt),
                details : pixelMapDetails
            }
            let unifiedData = new unifiedDataChannel.UnifiedData();
            let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
            unifiedData.addRecord(contentFormRecord)
            unifiedDataChannel.insertData(options, unifiedData).then((data) =>{
                let options1:unifiedDataChannel.Options ={
                    intention: unifiedDataChannel.Intention.DATA_HUB,
                    key:data
                }
                unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
                    let size = ret.length;
                    console.info(`data.size = ${size}`);
                    for (let i = 0; i < size; i++) {
                        let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
                        let size = records.length;
                        for (let j = 0; j < size; j++) {
                            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                            let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
                            if (record != undefined) {
                                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                                expect(record.uniformDataType).assertEqual(pixelMap.uniformDataType);
                                expect(imageInfo.size.height).assertEqual(opt.size.height);
                                expect(imageInfo.size.width).assertEqual(opt.size.width);
                            }
                        }
                    }
                    await unifiedDataChannel.deleteData(options1);
                    done();
                }).catch((err) => {
                    expect().assertFail();
                    await unifiedDataChannel.deleteData(options1);
                    done();
                });
                await unifiedDataChannel.deleteData(options1);
            }).catch((err) => {
                expect().assertFail();
                done();
            });
            console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4000 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100
         * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100
         * @tc.desc   Verify the properties of the contentForm type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
            console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100 start');
            let options: unifiedDataChannel.Options = {
                intention: unifiedDataChannel.Intention.DATA_HUB
            };
            let arrayBuffer = new ArrayBuffer(4*200*200);
            let opt : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 200, width: 200 }, alphaType: image.AlphaType.UNPREMUL };
            let pixelMap : uniformDataStruct.PixelMap = {
                uniformDataType : 'openharmony.pixel-map',
                pixelMap : image.createPixelMapSync(arrayBuffer, opt),
            }
            let unifiedData = new unifiedDataChannel.UnifiedData();
            let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
            unifiedData.addRecord(contentFormRecord)
            unifiedDataChannel.insertData(options, unifiedData).then((data) =>{
                let options1:unifiedDataChannel.Options ={
                    intention: unifiedDataChannel.Intention.DATA_HUB,
                    key:data
                }
                unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
                    let size = ret.length;
                    console.info(`data.size = ${size}`);
                    for (let i = 0; i < size; i++) {
                        let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
                        let size = records.length;
                        for (let j = 0; j < size; j++) {
                            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                            let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
                            if (record != undefined) {
                                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                                expect(record.uniformDataType).assertEqual(pixelMap.uniformDataType);
                                expect(imageInfo.size.height).assertEqual(opt.size.height);
                                expect(imageInfo.size.width).assertEqual(opt.size.width);
                                expect(imageInfo.pixelFormat).assertEqual(opt.pixelFormat);
                                expect(imageInfo.alphaType).assertEqual(opt.alphaType);
                            }
                        }
                    }
                    await unifiedDataChannel.deleteData(options1);
                    done();
                }).catch((err) => {
                    expect().assertFail();
                    await unifiedDataChannel.deleteData(options1);
                    done();
                });
                await unifiedDataChannel.deleteData(options1);
            }).catch((err) => {
                expect().assertFail();
                done();
            });
            console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4100 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500
         * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500
         * @tc.desc   Verify the properties of the contentForm type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
            console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500 start');
            let options: unifiedDataChannel.Options = {
                intention: unifiedDataChannel.Intention.DATA_HUB
            };
            let arrayBuffer = new ArrayBuffer(4*200*200);
            let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
            let pixelMap : uniformDataStruct.PixelMap = {
                uniformDataType : 'openharmony.pixel-map',
                pixelMap : image.createPixelMapSync(arrayBuffer, opt),
            }
            let unifiedData = new unifiedDataChannel.UnifiedData();
            let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
            unifiedData.addRecord(contentFormRecord)
            unifiedDataChannel.insertData(options, unifiedData).then((data) =>{
                let options1:unifiedDataChannel.Options ={
                    intention: unifiedDataChannel.Intention.DATA_HUB,
                    key:data
                }
                unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
                    let size = ret.length;
                    console.info(`data.size = ${size}`);
                    for (let i = 0; i < size; i++) {
                        let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
                        let size = records.length;
                        for (let j = 0; j < size; j++) {
                            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                            let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
                            if (record != undefined) {
                                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                                expect(record.uniformDataType).assertEqual(pixelMap.uniformDataType);
                                expect(imageInfo.size.height).assertEqual(opt.size.height);
                                expect(imageInfo.size.width).assertEqual(opt.size.width);
                                expect(imageInfo.pixelFormat).assertEqual(3);
                                expect(imageInfo.alphaType).assertEqual(2);
                                expect(imageInfo.density).assertEqual(0);
                                expect(imageInfo.stride).assertEqual(800);
                            }
                        }
                    }
                    await unifiedDataChannel.deleteData(options1);
                    done();
                }).catch((err) => {
                    expect().assertFail();
                    await unifiedDataChannel.deleteData(options1);
                    done();
                });
                await unifiedDataChannel.deleteData(options1);
            }).catch((err) => {
                expect().assertFail();
                done();
            });
            console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4500 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700
         * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700
         * @tc.desc   Verify the properties of the contentForm type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
            console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700 start');
            let options: unifiedDataChannel.Options = {
                intention: unifiedDataChannel.Intention.DATA_HUB
            };
            let arrayBuffer = new ArrayBuffer(4*200*200);
            let opt : image.InitializationOptions = { editable: true, size: { height: 200, width: 200 } };
            let pixelMap : uniformDataStruct.PixelMap = {
                uniformDataType : 'openharmony.pixel-map',
                pixelMap : image.createPixelMapSync(arrayBuffer, opt),
            }
            let unifiedData = new unifiedDataChannel.UnifiedData();
            let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
            unifiedData.addRecord(contentFormRecord)
            unifiedDataChannel.insertData(options, unifiedData).then((data) =>{
                let options1:unifiedDataChannel.Options ={
                    intention: unifiedDataChannel.Intention.DATA_HUB,
                    key:data
                }
                unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
                    let size = ret.length;
                    console.info(`data.size = ${size}`);
                    for (let i = 0; i < size; i++) {
                        let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
                        let size = records.length;
                        for (let j = 0; j < size; j++) {
                            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                            let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
                            if (record != undefined) {
                                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                                expect(record.uniformDataType).assertEqual(pixelMap.uniformDataType);
                                expect(imageInfo.size.height).assertEqual(opt.size.height);
                                expect(imageInfo.size.width).assertEqual(opt.size.width);
                                expect(imageInfo.pixelFormat).assertEqual(3);
                                expect(imageInfo.alphaType).assertEqual(2);
                                expect(imageInfo.density).assertEqual(0);
                                expect(imageInfo.stride).assertEqual(800);
                                expect(imageInfo.mimeType).assertEqual("");
                                expect(imageInfo.isHdr).assertEqual(false);
                            }
                        }
                    }
                    await unifiedDataChannel.deleteData(options1);
                    done();
                }).catch((err) => {
                    expect().assertFail();
                    await unifiedDataChannel.deleteData(options1);
                    done();
                });
                await unifiedDataChannel.deleteData(options1);
            }).catch((err) => {
                expect().assertFail();
                done();
            });
            console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_4700 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900
         * @tc.number SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900
         * @tc.desc   Verify the properties of the contentForm type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
            console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900 start');
            let options: unifiedDataChannel.Options = {
                intention: unifiedDataChannel.Intention.DATA_HUB
            };
            let opt : image.InitializationOptions = { editable: true,pixelFormat:image.PixelMapFormat.BGRA_8888, size: { height: 200, width: 200 } };
            let pixelMap : uniformDataStruct.PixelMap = {
                uniformDataType : 'openharmony.pixel-map',
                pixelMap : image.createPixelMapUsingAllocatorSync(opt, image.AllocatorType.SHARE_MEMORY),
            }
            let unifiedData = new unifiedDataChannel.UnifiedData();
            let contentFormRecord = new unifiedDataChannel.UnifiedRecord("openharmony.pixel-map", pixelMap);
            unifiedData.addRecord(contentFormRecord)
            unifiedDataChannel.insertData(options, unifiedData).then((data) =>{
                let options1:unifiedDataChannel.Options ={
                    intention: unifiedDataChannel.Intention.DATA_HUB,
                    key:data
                }
                unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
                    let size = ret.length;
                    console.info(`data.size = ${size}`);
                    for (let i = 0; i < size; i++) {
                        let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords();
                        let size = records.length;
                        for (let j = 0; j < size; j++) {
                            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                            let record = unifiedDataRecord.getValue() as uniformDataStruct.PixelMap;
                            if (record != undefined) {
                                let imageInfo:image.ImageInfo = await record.pixelMap.getImageInfo();
                                expect(record.uniformDataType).assertEqual(pixelMap.uniformDataType);
                                expect(imageInfo.size.height).assertEqual(opt.size.height);
                                expect(imageInfo.size.width).assertEqual(opt.size.width);
                                expect(imageInfo.pixelFormat).assertEqual(4);
                                expect(imageInfo.alphaType).assertEqual(2);
                                expect(imageInfo.density).assertEqual(0);
                                expect(imageInfo.stride).assertEqual(800);
                                expect(imageInfo.mimeType).assertEqual("");
                                expect(imageInfo.isHdr).assertEqual(false);
                            }
                        }
                    }
                    await unifiedDataChannel.deleteData(options1);
                    done();
                }).catch((err) => {
                    expect().assertFail();
                    await unifiedDataChannel.deleteData(options1);
                    done();
                });
                await unifiedDataChannel.deleteData(options1);
            }).catch((err) => {
                expect().assertFail();
                done();
            });
            console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_5900 end");
        });

        /**
         * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500
         * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500
         * @tc.desc   unifiedDataChannel insertData promise interface test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
            let Options:unifiedDataChannel.Options = {
                key: String(null)
            }
            let plainText = new unifiedDataChannel.PlainText();
            plainText.textContent = 'this is textContent';
            let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
            try {
                unifiedDataChannel.insertData(Options, unifiedData).then((data) => {
                    console.info(TAG + `data = ${data}, options = ${Options}`);
                    expect().assertFail();
                    done();
                }).catch((error) => {
                    let err = error as BusinessError;
                    console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
                    expect(err.code).assertEqual(401);
                    done();
                })
            } catch (error) {
                let err = error as BusinessError;
                console.error(TAG, `Failed to insertData0500 code is ${err.code},message is ${err.message} `);
                expect(err.code).assertEqual('401');
                done();
            }
        });

        hilog.info(domain, tag, '%{public}s', 'UDMFApiUtdUdsTest end');
    })
}
