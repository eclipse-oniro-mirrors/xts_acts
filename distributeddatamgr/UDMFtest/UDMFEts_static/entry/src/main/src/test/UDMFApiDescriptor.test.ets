/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import UTD from '@ohos.data.uniformTypeDescriptor'
let domain: int = 0x0000;
let tag: string = 'testTag';
const REFERENCE_URL =
  "https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis/js-apis-data-uniformTypeDescriptor.md#uniformdatatype";

export default function UDMFApiDescriptorTest() {
  describe("UDMFApiDescriptorTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'UDMFApiDescriptorTest start');
    let TAG = '';
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9777
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9777
     * @tc.desc   parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".xls"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9777', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9777';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        hilog.info(domain, tag, TAG + ' start ');
        let result = UTD.getUniformDataTypeByFilenameExtension(".xls");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(UTD.UniformDataType.EXCEL);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776
     * @tc.desc   predicates orderByAsc normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".xls", "general.composite-object");
        hilog.info(domain, tag, '%{public}s', "result=====>" + result);
        expect(result == "com.microsoft.excel.xls").assertEqual(true);
        done()
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645
     * @tc.desc   Invalid parameter to belongsTo() -- The relationship between the object of the parameter and "".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9645';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9611
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9611
     * @tc.desc   parameters to belongsTo -- The relationship between the object of the parameter and the parent of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9611';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615
     * @tc.desc   parameters to belongsTo -- The relationship between the object of the parameter and the next level of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9615';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.belongsTo(UTD.UniformDataType.NAVIGATION);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == false).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665
     * @tc.desc   parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the previous level of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9665';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9671
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9671
     * @tc.desc   parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the next level of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9671', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9671';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isLowerLevelType(UTD.UniformDataType.NAVIGATION);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == false).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720
     * @tc.desc   parameter to isHigherLevelType()--The high-level relationship between the object of a parameter and the level above the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9720';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.NAVIGATION);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725
     * @tc.desc   parameter to isHigherLevelType() --The high-level relationship between the object of a parameter and the level below the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9725';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == false).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300
     * @tc.desc   Equals the same parameter types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9300';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        if (!typeObj1) {
          hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
          expect(false).assertTrue();
          return;
        }
        let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        if (!typeObj2) {
          hilog.info(domain, tag, TAG + 'typeObj2 assertFail');
          expect(false).assertTrue();
          return;
        }
        let result = typeObj1.equals(typeObj2);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9401
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9401
     * @tc.desc   Equals the different parameter types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9401';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
        if (!typeObj1) {
          hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
          expect(false).assertTrue();
          return;
        }
        let typeObj2 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
        if (!typeObj2) {
          hilog.info(domain, tag, TAG + 'typeObj2 assertFail');
          expect(false).assertTrue();
          return;
        }
        let result = typeObj1.equals(typeObj2);
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == false).assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835
     * @tc.desc   parameter to getUniformDataTypeByMIMEType() --"image/tiff"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9835';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/tiff");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result == "general.tiff").assertEqual(true);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140
     * @tc.desc   parameter to getUniformDataTypesByFilenameExtension()  --parameter is ".xls"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1140';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypesByFilenameExtension(".xls");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertContain(UTD.UniformDataType.EXCEL);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190
     * @tc.desc   parameter to getUniformDataTypesByMIMEType() --"image/tiff"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1190';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypesByMIMEType("image/tiff");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(result).assertContain('general.tiff');
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710
     * @tc.desc   Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9710';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        hilog.info(domain, tag, TAG + ' isLowerLevelType start ');
        let result = typeObj1.isLowerLevelType("null");
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715
     * @tc.desc   Invalid parameter to isLowerLevelType()--The low-level relationship of the object of the parameter to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9715';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        hilog.info(domain, tag, TAG + ' isLowerLevelType start ');
        let result = typeObj1.isLowerLevelType("undefined");
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765
     * @tc.desc   Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9765';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        hilog.info(domain, tag, TAG + ' isHigherLevelType start ');
        let result = typeObj1.isHigherLevelType("null");
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770
     * @tc.desc   Invalid parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9770';
      hilog.info(domain, tag, TAG + ' start ');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      hilog.info(domain, tag, TAG + ' typeObj1: ' + typeObj1);
      if (!typeObj1) {
        hilog.info(domain, tag, TAG + 'typeObj1 assertFail');
        expect(false).assertTrue();
        return;
      }
      try {
        hilog.info(domain, tag, TAG + ' isHigherLevelType start ');
        let result = typeObj1.isHigherLevelType("undefined");
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900
     * @tc.desc   Illegal parameters null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8900';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let typeObj = UTD.getTypeDescriptor("null");
        if (!typeObj) {
          hilog.info(domain, tag, TAG + 'typeObj assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' typeObj: ' + typeObj);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780
     * @tc.desc   Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9780';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension("null");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9846
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9846
     * @tc.desc   Invalid  parameter to getUniformDataTypeByMIMEType() --parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9846', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9846';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180
     * @tc.desc   Invalid parameter to getUniformDataTypesByFilenameExtension()  --parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1180';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension("undefined");
        if (!result) {
          hilog.info(domain, tag, TAG + 'result assertFail');
          expect(false).assertTrue();
          return;
        }
        hilog.info(domain, tag, TAG + ' result: ' + result);
        expect(false).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220
     * @tc.desc   Invalid  parameter to getUniformDataTypesByMIMEType() --parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1220';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let result = UTD.getUniformDataTypesByMIMEType("");
        hilog.info(domain, tag, TAG + "result=====>" + result);
        expect().assertFail();
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done()
      }
      hilog.info(domain, tag, TAG + " end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100 start');
      expect(UTD.UniformDataType.TEXT).assertEqual("general.text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TEXT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.text");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("Base type for all text.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/*");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125
     * @tc.desc   Verify the properties of the entity type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125 start');
      expect(UTD.UniformDataType.ENTITY).assertEqual("general.entity");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.entity");
          expect(typeObj.belongingToTypes.length).assertEqual(0);
          expect(typeObj.description).assertEqual("Base type for physical hierarchy.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0125 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150
     * @tc.desc   Verify the properties of the object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150 start');
      expect(UTD.UniformDataType.OBJECT).assertEqual("general.object");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.object");
          expect(typeObj.belongingToTypes.length).assertEqual(0);
          expect(typeObj.description).assertEqual("Base type for logical hierarchy.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("*/*");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0150 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175
     * @tc.desc   Verify the properties of the composite-object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175 start');
      expect(UTD.UniformDataType.COMPOSITE_OBJECT).assertEqual("general.composite-object");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.COMPOSITE_OBJECT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.composite-object");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.object');
          expect(typeObj.description).assertEqual("Base type for mixed object. For example, a PDF file contains both text and special formatting data.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0175 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200
     * @tc.desc   Verify the properties of the plain text data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200 start');
      expect(UTD.UniformDataType.PLAIN_TEXT).assertEqual("general.plain-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PLAIN_TEXT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.plain-text");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.text');
          expect(typeObj.description).assertEqual("Text of unspecified encoding, with no markup.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_txt");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".txt,.text");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/plain");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300
     * @tc.desc   Verify the properties of the html data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300 start');
      expect(UTD.UniformDataType.HTML).assertEqual("general.html");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.HTML);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.html");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.text');
          expect(typeObj.description).assertEqual("HTML text.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_html");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".html,.htm");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/html");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400
     * @tc.desc   Verify the properties of the hyperlink data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400 start');
      expect(UTD.UniformDataType.HYPERLINK).assertEqual("general.hyperlink");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.HYPERLINK);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.hyperlink");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.text');
          expect(typeObj.description).assertEqual("Hyperlink.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500
     * @tc.desc   Verify the properties of the xml data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500 start');
      expect(UTD.UniformDataType.XML).assertEqual("general.xml");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.XML);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.xml");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.text');
          expect(typeObj.description).assertEqual("XML text.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_xml");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".xml");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/xml");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600
     * @tc.desc   Verify the properties of the Source code data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600 start');
      expect(UTD.UniformDataType.SOURCE_CODE).assertEqual("general.source-code");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SOURCE_CODE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.source-code");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.text');
          expect(typeObj.description).assertEqual("Generic source code.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700
     * @tc.desc   Verify the properties of the Script data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700 start');
      expect(UTD.UniformDataType.SCRIPT).assertEqual("general.script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.source-code');
          expect(typeObj.description).assertEqual("Base type for scripting language source code.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800
     * @tc.desc   Verify the properties of the Shell script data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800 start');
      expect(UTD.UniformDataType.SHELL_SCRIPT).assertEqual("general.shell-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SHELL_SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.shell-script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.script');
          expect(typeObj.description).assertEqual("Shell script.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".sh,.command");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-shellscript");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900
     * @tc.desc   Verify the properties of the C-shell script data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900 start');
      expect(UTD.UniformDataType.CSH_SCRIPT).assertEqual("general.csh-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CSH_SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.csh-script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.shell-script');
          expect(typeObj.description).assertEqual("C-shell script.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".csh");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-csh");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000
     * @tc.desc   Verify the properties of the Perl script data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000 start');
      expect(UTD.UniformDataType.PERL_SCRIPT).assertEqual("general.perl-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PERL_SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.perl-script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.shell-script');
          expect(typeObj.description).assertEqual("Perl script.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".pl,.pm");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-perl-script");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100
     * @tc.desc   Verify the properties of the PHP script data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100 start');
      expect(UTD.UniformDataType.PHP_SCRIPT).assertEqual("general.php-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PHP_SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.php-script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.shell-script');
          expect(typeObj.description).assertEqual("PHP script.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".php,.php3,.php4,.ph3,.ph4,.phtml");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-php-script,text/php,application/php");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200
     * @tc.desc   Verify the properties of the Python script data type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200 start');
      expect(UTD.UniformDataType.PYTHON_SCRIPT).assertEqual("general.python-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PYTHON_SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.python-script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.shell-script');
          expect(typeObj.description).assertEqual("Python script.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".py");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-python-script");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300
     * @tc.desc   Verify the properties of the Ruby script data type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300 start');
      expect(UTD.UniformDataType.RUBY_SCRIPT).assertEqual("general.ruby-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RUBY_SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.ruby-script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.shell-script');
          expect(typeObj.description).assertEqual("Ruby script.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".rb,.rbw");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/ruby-script");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400
     * @tc.desc   Verify the properties of the TypeScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400 start');
      expect(UTD.UniformDataType.TYPE_SCRIPT).assertEqual("general.type-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TYPE_SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.type-script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.source-code');
          expect(typeObj.description).assertEqual("TypeScript source code.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".ts");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500
     * @tc.desc   Verify the properties of the JavaScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500 start');
      expect(UTD.UniformDataType.JAVA_SCRIPT).assertEqual("general.java-script");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_SCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.java-script");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.source-code');
          expect(typeObj.description).assertEqual("JavaScript source code.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".js,.jscript,.javascript");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/javascript");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600
     * @tc.desc   Verify the properties of the JavaScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600 start');
      expect(UTD.UniformDataType.C_HEADER).assertEqual("general.c-header");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_HEADER);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.c-header");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.source-code');
          expect(typeObj.description).assertEqual("C header file.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".h");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-chdr");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700
     * @tc.desc   Verify the properties of the JavaScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700 start');
      expect(UTD.UniformDataType.C_SOURCE).assertEqual("general.c-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_SOURCE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.c-source");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.source-code');
          expect(typeObj.description).assertEqual("C source code.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".c");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-csrc");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800
     * @tc.desc   Verify the properties of the JavaScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800 start');
      expect(UTD.UniformDataType.C_PLUS_PLUS_HEADER).assertEqual("general.c-plus-plus-header");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.c-plus-plus-header");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.source-code');
          expect(typeObj.description).assertEqual("C++ header file.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".hpp,.h++,.hxx,.hh");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-c++hdr");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900
     * @tc.desc   Verify the properties of the JavaScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900 start');
      expect(UTD.UniformDataType.C_PLUS_PLUS_SOURCE).assertEqual("general.c-plus-plus-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.c-plus-plus-source");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.source-code');
          expect(typeObj.description).assertEqual("C++ source code.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".cp,.cpp,.c++,.cc,.cxx");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-c++src");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000
     * @tc.desc   Verify the properties of the JavaScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000 start');
      expect(UTD.UniformDataType.JAVA_SOURCE).assertEqual("general.java-source");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_SOURCE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.java-source");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.source-code');
          expect(typeObj.description).assertEqual("Java source code.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".java,.jav");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/x-java");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100
     * @tc.desc   Verify the properties of the Ebook data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100 start');
      expect(UTD.UniformDataType.EBOOK).assertEqual("general.ebook");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EBOOK);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.ebook");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.composite-object');
          expect(typeObj.description).assertEqual("Base type for ebook.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200
     * @tc.desc   Verify the properties of the EPUB ebook file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200 start');
      expect(UTD.UniformDataType.EPUB).assertEqual("general.epub");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EPUB);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.epub");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.ebook');
          expect(typeObj.description).assertEqual("Electronic publication (EPUB) format.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".epub");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/epub+zip");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300
     * @tc.desc   Verify the properties of the AZW ebook file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300 start');
      expect(UTD.UniformDataType.AZW).assertEqual("com.amazon.azw");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AZW);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.amazon.azw");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.ebook');
          expect(typeObj.description).assertEqual("AZW ebook.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".azw");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.amazon.ebook");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400
     * @tc.desc   Verify the properties of the AZW3 ebook file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400 start');
      expect(UTD.UniformDataType.AZW3).assertEqual("com.amazon.azw3");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AZW3);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.amazon.azw3");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.ebook');
          expect(typeObj.description).assertEqual("AZW3 ebook.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".azw3");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.amazon.mobi8-ebook,application/x-mobi8-ebook");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500
     * @tc.desc   Verify the properties of the KFX ebook file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500 start');
      expect(UTD.UniformDataType.KFX).assertEqual("com.amazon.kfx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.KFX);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.amazon.kfx");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.ebook');
          expect(typeObj.description).assertEqual("KFX ebook.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".kfx");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600
     * @tc.desc   Verify the properties of the KFX ebook file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600 start');
      expect(UTD.UniformDataType.MOBI).assertEqual("com.amazon.mobi");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MOBI);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.amazon.mobi");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.ebook');
          expect(typeObj.description).assertEqual("MOBI ebook.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".mobi");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/x-mobipocket-ebook");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700
     * @tc.desc   Verify the properties of the Media data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700 start');
      expect(UTD.UniformDataType.MEDIA).assertEqual("general.media");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MEDIA);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.media");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.object');
          expect(typeObj.description).assertEqual("Base type for media.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800
     * @tc.desc   Verify the properties of the Image data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800 start');
      expect(UTD.UniformDataType.IMAGE).assertEqual("general.image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.IMAGE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.image");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.media');
          expect(typeObj.description).assertEqual("Base type for images.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("image/*");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900
     * @tc.desc   Verify the properties of the JPEG image format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900 start');
      expect(UTD.UniformDataType.JPEG).assertEqual("general.jpeg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JPEG);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.jpeg");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.image');
          expect(typeObj.description).assertEqual("JPEG image.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".jpg,.jpeg,.jpe");
          expect(typeObj.mimeTypes.toString()).assertEqual("image/jpeg");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000
     * @tc.desc   Verify the properties of the png image format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000 start');
      expect(UTD.UniformDataType.PNG).assertEqual("general.png");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PNG);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.png");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.image');
          expect(typeObj.description).assertEqual("PNG image.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".png");
          expect(typeObj.mimeTypes.toString()).assertEqual("image/png");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100
     * @tc.desc   Verify the properties of the Raw image format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100 start');
      expect(UTD.UniformDataType.RAW_IMAGE).assertEqual("general.raw-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RAW_IMAGE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.raw-image");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.image');
          expect(typeObj.description).assertEqual("Base type for digital camera raw image formats.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200
     * @tc.desc   Verify the properties of the TIFF image format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200 start');
      expect(UTD.UniformDataType.TIFF).assertEqual("general.tiff");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TIFF);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.tiff");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.image');
          expect(typeObj.description).assertEqual("TIFF image.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".tif,.tiff");
          expect(typeObj.mimeTypes.toString()).assertEqual("image/tiff");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300
     * @tc.desc   Verify the properties of the Windows bitmap image data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300 start');
      expect(UTD.UniformDataType.BMP).assertEqual("com.microsoft.bmp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.BMP);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.bmp");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.image');
          expect(typeObj.description).assertEqual("Windows bitmap image.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".bmp,.bm");
          expect(typeObj.mimeTypes.toString()).assertEqual("image/bmp,image/x-ms-bmp");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400
     * @tc.desc   Verify the properties of the Windows icon data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400 start');
      expect(UTD.UniformDataType.ICO).assertEqual("com.microsoft.ico");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ICO);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.ico");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.image');
          expect(typeObj.description).assertEqual("Windows icon image.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".ico");
          expect(typeObj.mimeTypes.toString()).assertEqual("image/ico,image/x-icon");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500
     * @tc.desc   Verify the properties of the Adobe Photoshop document data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500 start');
      expect(UTD.UniformDataType.PHOTOSHOP_IMAGE).assertEqual("com.adobe.photoshop-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PHOTOSHOP_IMAGE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.adobe.photoshop-image");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.image');
          expect(typeObj.description).assertEqual("Adobe Photoshop document.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".psd");
          expect(typeObj.mimeTypes.toString()).assertEqual("image/x-photoshop,image/photoshop,image/psd,application/photoshop");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600
     * @tc.desc   Verify the properties of the Adobe Illustrator document data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600 start');
      expect(UTD.UniformDataType.AI_IMAGE).assertEqual("com.adobe.illustrator.ai-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AI_IMAGE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.adobe.illustrator.ai-image");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.image');
          expect(typeObj.description).assertEqual("Adobe Illustrator document.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".ai");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700
     * @tc.desc   Verify the properties of the Microsoft Word data type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700 start');
      expect(UTD.UniformDataType.WORD_DOC).assertEqual("com.microsoft.word.doc");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORD_DOC);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.word.doc");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.composite-object');
          expect(typeObj.description).assertEqual("Microsoft Word data.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_doc");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".doc");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/msword");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800
     * @tc.desc   Verify the properties of the Adobe Photoshop document data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800 start');
      expect(UTD.UniformDataType.EXCEL).assertEqual("com.microsoft.excel.xls");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EXCEL);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.excel.xls");
          expect(typeObj.belongingToTypes[0]).assertEqual('general.composite-object');
          expect(typeObj.description).assertEqual("Microsoft Excel data.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_xls");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".xls");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-excel");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900
     * @tc.desc   Verify the properties of the Microsoft PowerPoint presentation data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900 start');
      expect(UTD.UniformDataType.PPT).assertEqual("com.microsoft.powerpoint.ppt");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.powerpoint.ppt");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
          expect(typeObj.description).assertEqual("Microsoft PowerPoint presentation.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".ppt");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-powerpoint");
          } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_3900 end");
    });
    
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000
     * @tc.desc   Verify the properties of the PDF data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000 start');
      expect(UTD.UniformDataType.PDF).assertEqual("com.adobe.pdf");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PDF);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.adobe.pdf");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
          expect(typeObj.description).assertEqual("PDF data.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_pdf");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".pdf");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/pdf");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100
     * @tc.desc   Verify the properties of the PostScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100 start');
      expect(UTD.UniformDataType.POSTSCRIPT).assertEqual("com.adobe.postscript");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.adobe.postscript");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
          expect(typeObj.description).assertEqual("PostScript data.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".ps");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/postscript");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200
     * @tc.desc   Verify the properties of the Encapsulated PostScript data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200 start');
      expect(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT).assertEqual("com.adobe.encapsulated-postscript");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.adobe.encapsulated-postscript");
          expect(typeObj.belongingToTypes[0]).assertEqual("com.adobe.postscript");
          expect(typeObj.description).assertEqual("Encapsulated PostScript.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".eps");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300
     * @tc.desc   Verify the properties of the Video data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300 start');
      expect(UTD.UniformDataType.VIDEO).assertEqual("general.video");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.video");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
          expect(typeObj.description).assertEqual("Base type for video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/*");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400
     * @tc.desc   Verify the properties of the AVI video format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400 start');
      expect(UTD.UniformDataType.AVI).assertEqual("general.avi");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AVI);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.avi");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
          expect(typeObj.description).assertEqual("AVI video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".avi,.vfw");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/avi,video/msvideo,video/x-msvideo");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500
     * @tc.desc   Verify the properties of the MPEG video format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500 start');
      expect(UTD.UniformDataType.MPEG).assertEqual("general.mpeg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.mpeg");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
          expect(typeObj.description).assertEqual("MPEG-1 or MPEG-2 video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".mpg,.mpeg,.m75,.m15,.mpe");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/mpg,video/mpeg,video/x-mpg,video/x-mpeg");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600
     * @tc.desc   Verify the properties of the MPEG4 video format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600 start');
      expect(UTD.UniformDataType.MPEG4).assertEqual("general.mpeg-4");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG4);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.mpeg-4");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
          expect(typeObj.description).assertEqual("MPEG-4 video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".mp4,.mp4v,.mpeg4");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/mp4,video/mp4v");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700
     * @tc.desc   Verify the properties of the 3GPP video format data type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700 start');
      expect(UTD.UniformDataType.VIDEO_3GPP).assertEqual("general.3gpp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO_3GPP);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.3gpp");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
          expect(typeObj.description).assertEqual("3GPP video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".3gp,.3gpp");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/3gpp");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800
     * @tc.desc   Verify the properties of the 3GPP video format data type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800 start');
      expect(UTD.UniformDataType.VIDEO_3GPP2).assertEqual("general.3gpp2");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VIDEO_3GPP2);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.3gpp2");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
          expect(typeObj.description).assertEqual("3GPP2 video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".3g2,.3gp2,.3gpp2");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/3gpp2");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900
     * @tc.desc   Verify the properties of the Windows WM video format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WM).assertEqual("com.microsoft.windows-media-wm");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WM);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wm");
          expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
          expect(typeObj.description).assertEqual("Windows WM video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".wm");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wm");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_4900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000
     * @tc.desc   Verify the properties of the Windows WMV video format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMV).assertEqual("com.microsoft.windows-media-wmv");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmv");
          expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
          expect(typeObj.description).assertEqual("Windows WMV video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".wmv");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wmv");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100
     * @tc.desc   Verify the properties of the Windows WMP video format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMP).assertEqual("com.microsoft.windows-media-wmp");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMP);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmp");
          expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
          expect(typeObj.description).assertEqual("Windows WMP video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".wmp");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wmp");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200
     * @tc.desc   Verify the properties of the Audio data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200 start');
      expect(UTD.UniformDataType.AUDIO).assertEqual("general.audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AUDIO);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.audio");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.media");
          expect(typeObj.description).assertEqual("Base type for audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/*");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300
     * @tc.desc   Verify the properties of the AAC audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300 start');
      expect(UTD.UniformDataType.AAC).assertEqual("general.aac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AAC);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.aac");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
          expect(typeObj.description).assertEqual("AAC audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".aac");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/aac");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400
     * @tc.desc   Verify the properties of the AIFF audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400 start');
      expect(UTD.UniformDataType.AIFF).assertEqual("general.aiff");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AIFF);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.aiff");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
          expect(typeObj.description).assertEqual("AIFF audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".aiff");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/aiff");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500
     * @tc.desc   Verify the properties of the ALAC audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500 start');
      expect(UTD.UniformDataType.ALAC).assertEqual("general.alac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ALAC);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.alac");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
          expect(typeObj.description).assertEqual("ALAC audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".alac");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/alac");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600
     * @tc.desc   Verify the properties of the FLAC audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600 start');
      expect(UTD.UniformDataType.FLAC).assertEqual("general.flac");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FLAC);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.flac");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
          expect(typeObj.description).assertEqual("FLAC audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_flac");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".flac");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/flac");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700
     * @tc.desc   Verify the properties of the MP3 audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700 start');
      expect(UTD.UniformDataType.MP3).assertEqual("general.mp3");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MP3);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.mp3");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
          expect(typeObj.description).assertEqual("MPEG-3 audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_mp3");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".mp3");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/mp3");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800
     * @tc.desc   Verify the properties of the OGG audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800 start');
      expect(UTD.UniformDataType.OGG).assertEqual("general.ogg");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OGG);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.ogg");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
          expect(typeObj.description).assertEqual("OGG audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".ogg");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/ogg");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900
     * @tc.desc   Verify the properties of the PCM audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900 start');
      expect(UTD.UniformDataType.PCM).assertEqual("general.pcm");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PCM);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.pcm");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
          expect(typeObj.description).assertEqual("PCM audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".pcm");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/pcm");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_5900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000
     * @tc.desc   Verify the properties of the Windows WMA audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMA).assertEqual("com.microsoft.windows-media-wma");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wma");
          expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio,com.microsoft.advanced-systems-format");
          expect(typeObj.description).assertEqual("Windows WMA audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_wma");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".wma");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-ms-wma");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100
     * @tc.desc   Verify the properties of the Waveform audio format data type created by Microsoft
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100 start');
      expect(UTD.UniformDataType.WAVEFORM_AUDIO).assertEqual("com.microsoft.waveform-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WAVEFORM_AUDIO);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.waveform-audio");
          expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio,com.microsoft.advanced-systems-format");
          expect(typeObj.description).assertEqual("Waveform audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_wav");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".wav,.wave");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/wav,audio/wave,audio/x-wav");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200
     * @tc.desc   Verify the properties of the Windows WMX audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WMX).assertEqual("com.microsoft.windows-media-wmx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WMX);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wmx");
          expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
          expect(typeObj.description).assertEqual("Windows WMX video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".wmx");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wmx");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300
     * @tc.desc   Verify the properties of the Windows WVX audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WVX).assertEqual("com.microsoft.windows-media-wvx");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WVX);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wvx");
          expect(typeObj.belongingToTypes.toString()).assertEqual("general.video,com.microsoft.advanced-systems-format");
          expect(typeObj.description).assertEqual("Windows WVX video.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_video");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".wvx");
          expect(typeObj.mimeTypes.toString()).assertEqual("video/x-ms-wvx");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400
     * @tc.desc   Verify the properties of the Windows WAX audio format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400 start');
      expect(UTD.UniformDataType.WINDOWS_MEDIA_WAX).assertEqual("com.microsoft.windows-media-wax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WINDOWS_MEDIA_WAX);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.microsoft.windows-media-wax");
          expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio,com.microsoft.advanced-systems-format");
          expect(typeObj.description).assertEqual("Windows WAX audio.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_audio");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".wax");
          expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-ms-wax");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500
     * @tc.desc   Verify the properties of the File data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500 start');
      expect(UTD.UniformDataType.FILE).assertEqual("general.file");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FILE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.file");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
          expect(typeObj.description).assertEqual("Base type for file.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600
     * @tc.desc   Verify the properties of the Directory data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600 start');
      expect(UTD.UniformDataType.DIRECTORY).assertEqual("general.directory");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DIRECTORY);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.directory");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
          expect(typeObj.description).assertEqual("Base type for directory.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_folder");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700
     * @tc.desc   Verify the properties of the Folder data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700 start');
      expect(UTD.UniformDataType.FOLDER).assertEqual("general.folder");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FOLDER);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.folder");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.directory");
          expect(typeObj.description).assertEqual("Base type for folder.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_folder");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800
     * @tc.desc   Verify the properties of the Symlink data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800 start');
      expect(UTD.UniformDataType.SYMLINK).assertEqual("general.symlink");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SYMLINK);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.symlink");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.entity");
          expect(typeObj.description).assertEqual("Base type for symlink.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900
     * @tc.desc   Verify the properties of the Symlink data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900 start');
      expect(UTD.UniformDataType.ARCHIVE).assertEqual("general.archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ARCHIVE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.archive");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("Base type for an archive of files and directories.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_6900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000
     * @tc.desc   Verify the properties of the Bzip2 archive file data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000 start');
      expect(UTD.UniformDataType.BZ2_ARCHIVE).assertEqual("general.bz2-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.BZ2_ARCHIVE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.bz2-archive");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
          expect(typeObj.description).assertEqual("BZip2 archive.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".bz2,.bzip2");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/x-bzip2");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100
     * @tc.desc   Verify the properties of the Disk image archive file data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100 start');
      expect(UTD.UniformDataType.DISK_IMAGE).assertEqual("general.disk-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DISK_IMAGE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.disk-image");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
          expect(typeObj.description).assertEqual("Base type for items mountable as a volume.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200
     * @tc.desc   Verify the properties of the Tar archive data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200 start');
      expect(UTD.UniformDataType.TAR_ARCHIVE).assertEqual("general.tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TAR_ARCHIVE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.tar-archive");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
          expect(typeObj.description).assertEqual("Tar archive.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".tar");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/x-tar,application/tar");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300
     * @tc.desc   Verify the properties of the Zip archive data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300 start');
      expect(UTD.UniformDataType.ZIP_ARCHIVE).assertEqual("general.zip-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ZIP_ARCHIVE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.zip-archive");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
          expect(typeObj.description).assertEqual("Zip archive.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_zip");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".zip");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/zip");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400
     * @tc.desc   Verify the properties of the Java archive data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400 start');
      expect(UTD.UniformDataType.JAVA_ARCHIVE).assertEqual("com.sun.java-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JAVA_ARCHIVE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("com.sun.java-archive");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
          expect(typeObj.description).assertEqual("Java archive.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".jar");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/java-archive");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500
     * @tc.desc   Verify the properties of the GNU archive data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500 start');
      expect(UTD.UniformDataType.GNU_TAR_ARCHIVE).assertEqual("org.gnu.gnu-tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_TAR_ARCHIVE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("org.gnu.gnu-tar-archive");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
          expect(typeObj.description).assertEqual("GNU archive.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".gtar");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/x-gtar");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600
     * @tc.desc   Verify the properties of the Gzip archive data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600 start');
      expect(UTD.UniformDataType.GNU_ZIP_ARCHIVE).assertEqual("org.gnu.gnu-zip-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_ZIP_ARCHIVE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("org.gnu.gnu-zip-archive");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
          expect(typeObj.description).assertEqual("Gzip archive.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".gz,.gzip");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/x-gzip,application/gzip");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700
     * @tc.desc   Verify the properties of the Gzip tar archive data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700 start');
      expect(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE).assertEqual("org.gnu.gnu-zip-tar-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("org.gnu.gnu-zip-tar-archive");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
          expect(typeObj.description).assertEqual("Gzip tar archive.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_compress");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".tgz");
          expect(typeObj.mimeTypes.toString()).assertEqual("application/x-gtar");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800
     * @tc.desc   Verify the properties of the Calendar data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800 start');
      expect(UTD.UniformDataType.CALENDAR).assertEqual("general.calendar");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CALENDAR);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.calendar");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
          expect(typeObj.description).assertEqual("Base type for scheduled events.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_calendar");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/calendar");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900
     * @tc.desc   Verify the properties of the Contact data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900 start');
      expect(UTD.UniformDataType.CONTACT).assertEqual("general.contact");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.contact");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("Base type for contact information.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_7900 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000
     * @tc.desc   Verify the properties of the Database data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000 start');
      expect(UTD.UniformDataType.DATABASE).assertEqual("general.database");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DATABASE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.database");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("Base type for databases.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8000 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100
     * @tc.desc   Verify the properties of the Message data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100 start');
      expect(UTD.UniformDataType.MESSAGE).assertEqual("general.message");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MESSAGE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.message");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("Base type for messages.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8100 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200
     * @tc.desc   Verify the properties of the vcard format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200 start');
      expect(UTD.UniformDataType.VCARD).assertEqual("general.vcard");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VCARD);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.vcard");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("Base type for electronic business card.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".vcf,.vcard");
          expect(typeObj.mimeTypes.toString()).assertEqual("text/vcard,text/x-vcard");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8200 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300
     * @tc.desc   Verify the properties of the navigation data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300 start');
      expect(UTD.UniformDataType.NAVIGATION).assertEqual("general.navigation");
      let typeObj = 
      UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.navigation");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("Base type for navigation.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8300 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400
     * @tc.desc   Verify the properties of the Location data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400 start');
      expect(UTD.UniformDataType.LOCATION).assertEqual("general.location");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("general.location");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.navigation");
          expect(typeObj.description).assertEqual("Navigation location.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8400 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500
     * @tc.desc   Verify the properties of the openharmony.form  data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500 start');
      expect(UTD.UniformDataType.OPENHARMONY_FORM).assertEqual("openharmony.form");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_FORM);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("openharmony.form");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("OpenHarmony system defined form.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8500 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600
     * @tc.desc   Verify the properties of the openharmony.app-item  data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600 start');
      expect(UTD.UniformDataType.OPENHARMONY_APP_ITEM).assertEqual("openharmony.app-item");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_APP_ITEM);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("openharmony.app-item");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("OpenHarmony system defined app item.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8600 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700
     * @tc.desc   Verify the properties of the openharmony.pixel-map data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700 start');
      expect(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP).assertEqual("openharmony.pixel-map");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("openharmony.pixel-map");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
          expect(typeObj.description).assertEqual("OpenHarmony system defined pixel map.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8700 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800
     * @tc.desc   Verify the properties of the openharmony.atomic-service data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800 start');
      expect(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE).assertEqual("openharmony.atomic-service");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("openharmony.atomic-service");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.object");
          expect(typeObj.description).assertEqual("OpenHarmony system defined atomic service.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8800 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825
     * @tc.desc   Verify the properties of the openharmony.package data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825 start');
      expect(UTD.UniformDataType.OPENHARMONY_PACKAGE).assertEqual("openharmony.package");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PACKAGE);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("openharmony.package");
          expect(typeObj.belongingToTypes[0]).assertEqual("general.directory");
          expect(typeObj.description)
            .assertEqual("OpenHarmony system defined package (that is, a directory presented to the user as a file).");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual("");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8825 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850
     * @tc.desc   Verify the properties of the openharmony.hap data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850 start');
      expect(UTD.UniformDataType.OPENHARMONY_HAP).assertEqual("openharmony.hap");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HAP);
      try {
        if (typeObj) {
          console.log(tag + "typeId:" + typeObj.typeId);
          console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
          console.log(tag + "description:" + typeObj.description);
          console.log(tag + "referenceURL:" + typeObj.referenceURL);
          console.log(tag + "iconFile:" + typeObj.iconFile);
          console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
          console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
          expect(typeObj.typeId).assertEqual("openharmony.hap");
          expect(typeObj.belongingToTypes[0]).assertEqual("openharmony.package");
          expect(typeObj.description).assertEqual("OpenHarmony system defined ability package.");
          expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
          expect(typeObj.iconFile).assertEqual("");
          expect(typeObj.filenameExtensions.toString()).assertEqual(".hap");
          expect(typeObj.mimeTypes.toString()).assertEqual("");
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
      console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
      expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_8850 end");
    });
    
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620
     * @tc.desc   parameters to belongsTo -- The relationship between the object of the parameter and the two levels above the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.LOCATION);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(true);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9620 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625
     * @tc.desc   parameters to belongsTo -- ToThe relationship between the object of the parameter and the two levels below the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo(UTD.UniformDataType.LOCATION);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9625 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630
     * @tc.desc   parameter to belongsTo()-- The relationship between the object of the parameter and the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CALENDAR);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo(UTD.UniformDataType.CALENDAR);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(true);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9630 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635
     * @tc.desc   parameter to belongsTo()-- The relationship between the object of the parameter and the parameter at the same level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo(UTD.UniformDataType.TEXT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9635 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640
     * @tc.desc   parameter to belongsTo()-- The relationship between the object of the parameter and the parameter at the same level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo(UTD.UniformDataType.OBJECT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9640 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680
     * @tc.desc   parameter to isLowerLevelType() --The low-level relationship between the object of a parameter and the lower two levels of the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType(UTD.UniformDataType.LOCATION);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9680 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685
     * @tc.desc   parameter to isLowerLevelType()--A low-level relationship between an object of a parameter and the same parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.COMPOSITE_OBJECT);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType(UTD.UniformDataType.COMPOSITE_OBJECT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9685 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690
     * @tc.desc   parameter to isLowerLevelType()--The low-level relationship between the object of a parameter and the parameter at the same level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9690 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695
     * @tc.desc   parameter to isLowerLevelType()--The low-level relationship between the object of a parameter and the parameter at the same level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.NAVIGATION);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType(UTD.UniformDataType.TEXT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9695 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730
     * @tc.desc   parameter to isHigherLevelType() --The object of a parameter has a high-level relationship with two levels above the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.OBJECT);
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType(UTD.UniformDataType.LOCATION);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(true);
        } else {
          expect().assertFail();
        } 
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9730 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740
     * @tc.desc   parameter to isHigherLevelType() --The high-level relationship between the object of the parameter and the parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.C_HEADER);
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType(UTD.UniformDataType.C_HEADER);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9740 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745
     * @tc.desc   parameter to isHigherLevelType() --The object of a parameter is a high-level relationship with the parameter at the same level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.ENTITY);
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType(UTD.UniformDataType.OBJECT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9745 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750
     * @tc.desc   parameter to isHigherLevelType() --The object of a parameter is a high-level relationship with the parameter at the same level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750 start');
      let typeObj1 = UTD.getTypeDescriptor(UTD.UniformDataType.CONTACT);
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType(UTD.UniformDataType.MESSAGE);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        } 
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9750 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825
     * @tc.desc   Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are invalid parameter ".hello" and UTD.UniformDataType.ICO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825 start');
      try {
        let dynamicType = UTD.getUniformDataTypeByFilenameExtension(".hello", UTD.UniformDataType.ICO);
        console.log(tag + "dynamicType=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
        if (dynamicTypeObj) {
          console.log(tag + "UDMF,typeId:" + dynamicTypeObj.typeId);
          console.log(tag + "UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
          console.log(tag + "UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
          console.log(tag + "UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
          expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
          expect(dynamicTypeObj.belongingToTypes[0]).assertEqual(UTD.UniformDataType.ICO);
          expect(dynamicTypeObj.filenameExtensions[0]).assertEqual(".hello");
          expect(dynamicTypeObj.mimeTypes.length).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9825 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860
     * @tc.desc   parameter to getUniformDataTypeByMIMEType()  --parameter are "image/tiff" and "general.type-script"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("audio/x-ms-wma", UTD.UniformDataType.WINDOWS_MEDIA_WMA);
        console.log(tag + "result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9860 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865
     * @tc.desc   Invalid  parameter to getUniformDataTypeByMIMEType() --parameter are "image/tiff"and invalid parameter "general.type-script"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865 start');
      try {
        let dynamicType = UTD.getUniformDataTypeByMIMEType("image/tiff", UTD.UniformDataType.TYPE_SCRIPT);
        console.log(tag + "dynamicType=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType);
        if (dynamicTypeObj) {
          console.log(tag + "UDMF,typeId:" + dynamicTypeObj.typeId);
          console.log(tag + "UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
          console.log(tag + "UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
          console.log(tag + "UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
          expect(dynamicTypeObj.typeId).assertEqual(dynamicType);
          expect(dynamicTypeObj.belongingToTypes[0]).assertEqual(UTD.UniformDataType.TYPE_SCRIPT);
          expect(dynamicTypeObj.mimeTypes[0]).assertEqual("image/tiff");
          expect(dynamicTypeObj.filenameExtensions.length).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9865 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810
     * @tc.desc   Invalid parameter to getUniformDataTypeByFilenameExtension()  --parameters are ".wav" and invalid parameter "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".wave", "general.hello");
        console.log(tag + "result=====>" + result);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9810 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210
     * @tc.desc   Verify the properties of the com.real.smil data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210 start');
      expect(UTD.UniformDataType.SMIL).assertEqual("com.real.smil");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SMIL);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.real.smil");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.xml");
        expect(typeObj.description).assertEqual("Real synchronized multimedia integration language.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".smil");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/smil");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0210 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220
     * @tc.desc   Verify the properties of the markdown data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220 start');
      expect(UTD.UniformDataType.MARKDOWN).assertEqual("general.markdown");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MARKDOWN);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.markdown");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.text");
        expect(typeObj.description).assertEqual("Markdown format.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".md,.markdown,.markdn,.mdown");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/markdown");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0220 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240
     * @tc.desc   Verify the properties of the com.j2.jfx-fax data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240 start');
      expect(UTD.UniformDataType.JFX_FAX).assertEqual("com.j2.jfx-fax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.JFX_FAX);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.j2.jfx-fax");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.fax");
        expect(typeObj.description).assertEqual("J2 fax.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".jfx");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0240 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250
     * @tc.desc   Verify the properties of the xbitmap-image data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250 start');
      expect(UTD.UniformDataType.XBITMAP_IMAGE).assertEqual("general.xbitmap-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.XBITMAP_IMAGE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.xbitmap-image");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
        expect(typeObj.description).assertEqual("X bitmap image.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".xbm");
        expect(typeObj.mimeTypes.toString()).assertEqual("image/x-xbitmap,image/x-xbm");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0250 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260
     * @tc.desc   Verify the properties of the com.sgi.sgi-image data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260 start');
      expect(UTD.UniformDataType.SGI_IMAGE).assertEqual("com.sgi.sgi-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SGI_IMAGE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.sgi.sgi-image");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
        expect(typeObj.description).assertEqual("Silicon Graphics image.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".sgi");
        expect(typeObj.mimeTypes.toString()).assertEqual("image/sgi");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0260 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270
     * @tc.desc   Verify the properties of the com.kodak.flashpix.image data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270 start');
      expect(UTD.UniformDataType.FLASHPIX_IMAGE).assertEqual("com.kodak.flashpix.image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FLASHPIX_IMAGE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.kodak.flashpix.image");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
        expect(typeObj.description).assertEqual("FlashPix image.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".fpx");
        expect(typeObj.mimeTypes.toString()).assertEqual("image/fpx,application/vnd.fpx");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0270 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280
     * @tc.desc   Verify the properties of the com.real.realmedia data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280 start');
      expect(UTD.UniformDataType.REALMEDIA).assertEqual("com.real.realmedia");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.REALMEDIA);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.real.realmedia");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.video");
        expect(typeObj.description).assertEqual("RealMedia.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".rm");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.rn-realmedia");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0280 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290
     * @tc.desc   Verify the properties of the au-audio data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290 start');
      expect(UTD.UniformDataType.AU_AUDIO).assertEqual("general.au-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AU_AUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.au-audio");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("Au file format.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".au,.snd");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/basic,audio/au,audio/snd");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0290 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310
     * @tc.desc   Verify the properties of the com.digidesign.sd2-audio data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310 start');
      expect(UTD.UniformDataType.SD2_AUDIO).assertEqual("com.digidesign.sd2-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SD2_AUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.digidesign.sd2-audio");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("Digidesign Sound Designer II audio.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".sd2");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-sd2");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0310 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320
     * @tc.desc   Verify the properties of the raw-image data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320 start');
      expect(UTD.UniformDataType.RAW_IMAGE).assertEqual("general.raw-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RAW_IMAGE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.raw-image");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
        expect(typeObj.description).assertEqual("Base type for digital camera raw image formats.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0320 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330
     * @tc.desc   Verify the properties of the fax data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330 start');
      expect(UTD.UniformDataType.FAX).assertEqual("general.fax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FAX);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.fax");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
        expect(typeObj.description).assertEqual("Base type for fax images.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0330 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340
     * @tc.desc   Verify the properties of the com.js.efx-fax data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340 start');
      expect(UTD.UniformDataType.EFX_FAX).assertEqual("com.js.efx-fax");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EFX_FAX);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.js.efx-fax");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.fax");
        expect(typeObj.description).assertEqual("eFax fax.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".efx");
        expect(typeObj.mimeTypes.toString()).assertEqual("image/efax");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0340 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360
     * @tc.desc   Verify the properties of the com.truevision.tga-image data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360 start');
      expect(UTD.UniformDataType.TGA_IMAGE).assertEqual("com.truevision.tga-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TGA_IMAGE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.truevision.tga-image");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
        expect(typeObj.description).assertEqual("TGA image.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".tga");
        expect(typeObj.mimeTypes.toString()).assertEqual("image/targa,image/tga,application/tga");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0360 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370
     * @tc.desc   Verify the properties of the com.ilm.openexr-image data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370 start');
      expect(UTD.UniformDataType.OPENEXR_IMAGE).assertEqual("com.ilm.openexr-image");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENEXR_IMAGE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.ilm.openexr-image");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.image");
        expect(typeObj.description).assertEqual("OpenEXR image.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".exr");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0370 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380
     * @tc.desc   Verify the properties of the aifc-audio data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380 start');
      expect(UTD.UniformDataType.AIFC_AUDIO).assertEqual("general.aifc-audio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.AIFC_AUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.aifc-audio");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("Audio Interchange File Format.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".aifc,.aif,.aiff");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-aiff");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0380 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390
     * @tc.desc   Verify the properties of the com.real.realaudio data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390 start');
      expect(UTD.UniformDataType.REALAUDIO).assertEqual("com.real.realaudio");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.REALAUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.real.realaudio");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("RealMedia audio.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".ram,.ra");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/vnd.rn-realaudio,audio/x-pn-realaudio");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0390 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410
     * @tc.desc   Verify the properties of the org.openxmlformats.openxml data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410 start');
      expect(UTD.UniformDataType.OPENXML).assertEqual("org.openxmlformats.openxml");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENXML);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.openxmlformats.openxml");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
        expect(typeObj.description).assertEqual("Office Open XML.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0410 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420
     * @tc.desc   Verify the properties of the org.openxmlformats.wordprocessingml.document data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420 start');
      expect(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT).assertEqual("org.openxmlformats.wordprocessingml.document");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.openxmlformats.wordprocessingml.document");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Office Open XML Document.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".docx");
        expect(typeObj.mimeTypes.toString())
          .assertEqual("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0420 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430
     * @tc.desc   Verify the properties of the org.openxmlformats.spreadsheetml.sheet data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430 start');
      expect(UTD.UniformDataType.SPREADSHEETML_SHEET).assertEqual("org.openxmlformats.spreadsheetml.sheet");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SPREADSHEETML_SHEET);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.openxmlformats.spreadsheetml.sheet");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Office Open XML Workbook.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".xlsx");
        expect(typeObj.mimeTypes.toString())
          .assertEqual("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0430 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440
     * @tc.desc   Verify the properties of the org.openxmlformats.presentationml.presentation data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440 start');
      expect(UTD.UniformDataType.PRESENTATIONML_PRESENTATION)
        .assertEqual("org.openxmlformats.presentationml.presentation");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PRESENTATIONML_PRESENTATION);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.openxmlformats.presentationml.presentation");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Office Open XML Presentation.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".pptx");
        expect(typeObj.mimeTypes.toString())
          .assertEqual("application/vnd.openxmlformats-officedocument.presentationml.presentation");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0440 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450
     * @tc.desc   Verify the properties of the org.oasis.opendocument data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450 start');
      expect(UTD.UniformDataType.OPENDOCUMENT).assertEqual("org.oasis.opendocument");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.oasis.opendocument");
        expect(typeObj.belongingToTypes[0]).assertEqual("general.archive");
        expect(typeObj.description).assertEqual("Open Document Format for Office Applications.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0450 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460
     * @tc.desc   Verify the properties of the org.oasis.opendocument.text data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_TEXT).assertEqual("org.oasis.opendocument.text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_TEXT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.oasis.opendocument.text");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object,org.oasis.opendocument");
        expect(typeObj.description).assertEqual("OpenDocument Text.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".odt,.fodt");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.text");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0460 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470
     * @tc.desc   Verify the properties of the org.oasis.opendocument.spreadsheet data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET).assertEqual("org.oasis.opendocument.spreadsheet");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.oasis.opendocument.spreadsheet");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object,org.oasis.opendocument");
        expect(typeObj.description).assertEqual("OpenDocument Spreadsheet.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".ods,.fods");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.spreadsheet");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0470 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480
     * @tc.desc   Verify the properties of the org.oasis.opendocument.presentation data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION).assertEqual("org.oasis.opendocument.presentation");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.oasis.opendocument.presentation");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object,org.oasis.opendocument");
        expect(typeObj.description).assertEqual("OpenDocument Presentation.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".odp,.fodp");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.presentation");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0480 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490
     * @tc.desc   Verify the properties of the org.oasis.opendocument.graphics data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS).assertEqual("org.oasis.opendocument.graphics");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.oasis.opendocument.graphics");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object,org.oasis.opendocument");
        expect(typeObj.description).assertEqual("OpenDocument Graphics.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".odg,.fodg");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.graphics");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0490 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510
     * @tc.desc   Verify the properties of the org.oasis.opendocument.formula data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510 start');
      expect(UTD.UniformDataType.OPENDOCUMENT_FORMULA).assertEqual("org.oasis.opendocument.formula");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENDOCUMENT_FORMULA);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("org.oasis.opendocument.formula");
        expect(typeObj.belongingToTypes.toString()).assertEqual("org.oasis.opendocument");
        expect(typeObj.description).assertEqual("OpenDocument Formulat.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".odf");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.oasis.opendocument.formula");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0510 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520
     * @tc.desc   Verify the properties of the com.allume.stuffit-archive data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520 start');
      expect(UTD.UniformDataType.STUFFIT_ARCHIVE).assertEqual("com.allume.stuffit-archive");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.STUFFIT_ARCHIVE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.allume.stuffit-archive");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
        expect(typeObj.description).assertEqual("Stuffit archive.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".sit,.sitx");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/x-stuffit,application/x-sit,application/stuffit");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0520 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530
     * @tc.desc   Verify the properties of the vcs data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530 start');
      expect(UTD.UniformDataType.VCS).assertEqual("general.vcs");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VCS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.vcs");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.calendar");
        expect(typeObj.description).assertEqual("vCalendar type.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".vcs");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/calendar");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0530 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540
     * @tc.desc   Verify the properties of the ics data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540 start');
      expect(UTD.UniformDataType.ICS).assertEqual("general.ics");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ICS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.ics");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.calendar");
        expect(typeObj.description).assertEqual("iCalendar type.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".ics");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/calendar");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0540 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550
     * @tc.desc   Verify the properties of the executable data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550 start');
      expect(UTD.UniformDataType.EXECUTABLE).assertEqual("general.executable");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EXECUTABLE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.executable");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
        expect(typeObj.description).assertEqual("Base type for executable data.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0550 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560
     * @tc.desc   Verify the properties of the com.microsoft.portable-executable data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560 start');
      expect(UTD.UniformDataType.PORTABLE_EXECUTABLE).assertEqual("com.microsoft.portable-executable");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PORTABLE_EXECUTABLE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.microsoft.portable-executable");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.executable");
        expect(typeObj.description).assertEqual("Microsoft Windows application.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".exe,.dll");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.microsoft.portable-executable");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0560 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570
     * @tc.desc   Verify the properties of the com.sun.java-class data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570 start');
      expect(UTD.UniformDataType.SUN_JAVA_CLASS).assertEqual("com.sun.java-class");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SUN_JAVA_CLASS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.sun.java-class");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.executable");
        expect(typeObj.description).assertEqual("Java class.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".class");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0570 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580
     * @tc.desc   Verify the properties of the font data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580 start');
      expect(UTD.UniformDataType.FONT).assertEqual("general.font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FONT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.font");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
        expect(typeObj.description).assertEqual("Base type for fonts.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0580 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590
     * @tc.desc   Verify the properties of the truetype-font data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590 start');
      expect(UTD.UniformDataType.TRUETYPE_FONT).assertEqual("general.truetype-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TRUETYPE_FONT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.truetype-font");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.font");
        expect(typeObj.description).assertEqual("TrueType font.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".ttf");
        expect(typeObj.mimeTypes.toString()).assertEqual("font/ttf");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0590 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610
     * @tc.desc   Verify the properties of the truetype-collection-font data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610 start');
      expect(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT).assertEqual("general.truetype-collection-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.truetype-collection-font");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.font");
        expect(typeObj.description).assertEqual("TrueType collection font.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".ttc");
        expect(typeObj.mimeTypes.toString()).assertEqual("font/collection");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0610 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620
     * @tc.desc   Verify the properties of the opentype-font data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620 start');
      expect(UTD.UniformDataType.OPENTYPE_FONT).assertEqual("general.opentype-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENTYPE_FONT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.opentype-font");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.font");
        expect(typeObj.description).assertEqual("OpenType font.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".otf");
        expect(typeObj.mimeTypes.toString()).assertEqual("font/otf");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0620 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630
     * @tc.desc   Verify the properties of the com.adobe.postscript-font data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630 start');
      expect(UTD.UniformDataType.POSTSCRIPT_FONT).assertEqual("com.adobe.postscript-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT_FONT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.adobe.postscript-font");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.font");
        expect(typeObj.description).assertEqual("PostScript font.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0630 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640
     * @tc.desc   Verify the properties of the com.adobe.postscript-pfb-font data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640 start');
      expect(UTD.UniformDataType.POSTSCRIPT_PFB_FONT).assertEqual("com.adobe.postscript-pfb-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT_PFB_FONT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.adobe.postscript-pfb-font");
        expect(typeObj.belongingToTypes.toString()).assertEqual("com.adobe.postscript-font");
        expect(typeObj.description).assertEqual("Printer Font Binary, PostScript Type 1 outline font.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".pfb");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/x-font");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0640 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650
     * @tc.desc   Verify the properties of the com.adobe.postscript-pfa-font data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650 start');
      expect(UTD.UniformDataType.POSTSCRIPT_PFA_FONT).assertEqual("com.adobe.postscript-pfa-font");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POSTSCRIPT_PFA_FONT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.adobe.postscript-pfa-font");
        expect(typeObj.belongingToTypes.toString()).assertEqual("com.adobe.postscript-font");
        expect(typeObj.description).assertEqual("Printer Pont ASCII file, PostScript Type 1 outline font.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".pfa");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/x-font");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0650 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660
     * @tc.desc   Verify the properties of the openharmony.form data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660 start');
      expect(UTD.UniformDataType.OPENHARMONY_FORM).assertEqual("openharmony.form");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_FORM);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.form");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
        expect(typeObj.description).assertEqual("OpenHarmony system defined form.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0660 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670
     * @tc.desc   Verify the properties of the openharmony.app-item data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670 start');
      expect(UTD.UniformDataType.OPENHARMONY_APP_ITEM).assertEqual("openharmony.app-item");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_APP_ITEM);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.app-item");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
        expect(typeObj.description).assertEqual("OpenHarmony system defined app item.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0670 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680
     * @tc.desc   Verify the properties of the openharmony.pixel-map data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680 start');
      expect(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP).assertEqual("openharmony.pixel-map");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.pixel-map");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.image");
        expect(typeObj.description).assertEqual("OpenHarmony system defined pixel map.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("sys.media.ohos_ic_normal_white_grid_image");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0680 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690
     * @tc.desc   Verify the properties of the openharmony.atomic-service data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690 start');
      expect(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE).assertEqual("openharmony.atomic-service");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.atomic-service");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
        expect(typeObj.description).assertEqual("OpenHarmony system defined atomic service.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0690 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710
     * @tc.desc   Verify the properties of the openharmony.package data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710 start');
      expect(UTD.UniformDataType.OPENHARMONY_PACKAGE).assertEqual("openharmony.package");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_PACKAGE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.package");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.directory");
        expect(typeObj.description)
          .assertEqual("OpenHarmony system defined package (that is, a directory presented to the user as a file).");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0710 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720
     * @tc.desc   Verify the properties of the openharmony.hap data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720 start');
      expect(UTD.UniformDataType.OPENHARMONY_HAP).assertEqual("openharmony.hap");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HAP);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.hap");
        expect(typeObj.belongingToTypes.toString()).assertEqual("openharmony.package");
        expect(typeObj.description).assertEqual("OpenHarmony system defined ability package.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".hap");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0720 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730
     * @tc.desc   Verify the properties of the openharmony.hdoc data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730 start');
      expect(UTD.UniformDataType.OPENHARMONY_HDOC).assertEqual("openharmony.hdoc");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HDOC);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.hdoc");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("OpenHarmony system AppNotepad data format.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".hdoc");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0730 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740
     * @tc.desc   Verify the properties of the openharmony.styled-string data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740 start');
      expect(UTD.UniformDataType.OPENHARMONY_STYLED_STRING).assertEqual("openharmony.styled-string");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_STYLED_STRING);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.styled-string");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("OpenHarmony system defined styled string.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0740 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750
     * @tc.desc   Verify the properties of the openharmony.hinote data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750 start');
      expect(UTD.UniformDataType.OPENHARMONY_HINOTE).assertEqual("openharmony.hinote");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_HINOTE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.hinote");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("OpenHarmony system Notes data format.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".hinote");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0750 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760
     * @tc.desc   Verify the properties of the openharmony.want data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760 start');
      expect(UTD.UniformDataType.OPENHARMONY_WANT).assertEqual("openharmony.want");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPENHARMONY_WANT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("openharmony.want");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
        expect(typeObj.description).assertEqual("OpenHarmony system defined Want.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0760 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770
     * @tc.desc   Verify the properties of the com.sun.java-class data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770 start');
      expect(UTD.UniformDataType.SUN_JAVA_CLASS).assertEqual("com.sun.java-class");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SUN_JAVA_CLASS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("com.sun.java-class");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.executable");
        expect(typeObj.description).assertEqual("Java class.");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".class");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0770 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0790
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0790
     * @tc.desc   getUniformDataTypeByMIMEType --Fuzzy queries parameter --image/*
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0790 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("image/*");
        console.log(tag + "result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.IMAGE);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0790 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810
     * @tc.desc   getUniformDataTypeByMIMEType --Fuzzy queries parameter --video/*
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("video/*");
        console.log(tag + "result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.VIDEO);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0810 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820
     * @tc.desc   getUniformDataTypeByMIMEType --Fuzzy queries parameter --audio/*
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("audio/*");
        console.log(tag + "result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.AUDIO);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0820 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850
     * @tc.desc   parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".mytext" "general.plain-text"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj = UTD.getTypeDescriptor(result);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("flex.zh4yd2z3fnzsxeylmfzygyyljnywxizlyoq5depjonv4xizlyoq");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.plain-text");
        expect(typeObj.description).assertEqual("");
        expect(typeObj.referenceURL).assertEqual("");
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".mytext");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0850 end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860
     * @tc.desc   parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".mytext"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mytext");
      let typeObj = UTD.getTypeDescriptor(result);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("flex.zh45depjonv4xizlyoq");
        expect(typeObj.belongingToTypes.toString()).assertEqual("");
        expect(typeObj.description).assertEqual("");
        expect(typeObj.referenceURL).assertEqual("");
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".mytext");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0860 end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870
     * @tc.desc   parameter to getUniformDataTypeByFilenameExtension()  --parameter is ".mytext","general.cumtomType"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.cumtomType");
        if (result) {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0870 end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880
     * @tc.desc   Dynamic type acquisition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880 start');
      let result = UTD.getUniformDataTypeByMIMEType(".mytext", "general.plain-text");
      let typeObj = UTD.getTypeDescriptor(result);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("flex.zh4yd2z3fnzsxeylmfzygyyljnywxizlyoq5dcpjonv4xizlyoq");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.plain-text");
        expect(typeObj.description).assertEqual("");
        expect(typeObj.referenceURL).assertEqual("");
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual(".mytext");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0880 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890
     * @tc.desc   Dynamic type acquisition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890 start');
      let result = UTD.getUniformDataTypeByMIMEType("g");
      let typeObj = UTD.getTypeDescriptor(result);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("flex.zh45dcplh");
        expect(typeObj.belongingToTypes.toString()).assertEqual("");
        expect(typeObj.description).assertEqual("");
        expect(typeObj.referenceURL).assertEqual("");
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("g");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0890 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910
     * @tc.desc   parameter to getUniformDataTypeByMIMEType()  --parameter is ".mytext","general.cumtomType"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType(".mytext", "general.cumtomType");
        if (result) {
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0910 end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920
     * @tc.desc   Dynamic type acquisition parameter to isLowerLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj1 = UTD.getTypeDescriptor(result);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType(UTD.UniformDataType.OBJECT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(true);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0920 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930
     * @tc.desc   Dynamic type acquisition parameter to isLowerLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj1 = UTD.getTypeDescriptor(result);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType(UTD.UniformDataType.HTML);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0930 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940
     * @tc.desc   Dynamic type acquisition parameter to isLowerLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      let result2 = UTD.getUniformDataTypeByFilenameExtension(".texcl");
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType(result2);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0940 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950
     * @tc.desc   Dynamic type acquisition parameter to isHigherLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.plain-text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      let result2 = UTD.getUniformDataTypeByFilenameExtension(".texcl");
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType(result2);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0950 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960
     * @tc.desc   Dynamic type acquisition parameter to isHigherLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.object");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType(UTD.UniformDataType.TEXT);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0960 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970
     * @tc.desc   Dynamic type acquisition parameter to belongsTo()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo('general.object');
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(true);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0970 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980
     * @tc.desc   Dynamic type acquisition parameter to belongsTo()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo('general.plain-text');
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0980 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990
     * @tc.desc   Dynamic type acquisition parameter to belongsTo()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      let result2 = UTD.getUniformDataTypeByFilenameExtension(".myexel", "general.plain-text");
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo(result2);
          console.log(tag + "result==>" + result);
          expect(result).assertEqual(false);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0990 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010
     * @tc.desc   Dynamic vs. Illegal Types  parameter to belongsTo()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo("general.hello");
          console.log(tag + "result==>" + result);
          expect().assertFail();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1010 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020
     * @tc.desc   Dynamic vs. Illegal Types  parameter to isHigherLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType("general.hello");
          console.log(tag + "result==>" + result);
          expect().assertFail();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1020 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030
     * @tc.desc   Dynamic vs. Illegal Types  parameter to isLowerLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType("general.hello");
          console.log(tag + "result==>" + result);
          expect().assertFail();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1030 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040
     * @tc.desc   Dynamic vs. Illegal Types  parameter to belongsTo()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.belongsTo("");
          console.log(tag + "result==>" + result);
          expect().assertFail();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1040 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050
     * @tc.desc   Dynamic vs. Illegal Types  parameter to isHigherLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.isHigherLevelType("");
          console.log(tag + "result==>" + result);
          expect().assertFail();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1050 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060
     * @tc.desc   Dynamic vs. Illegal Types  parameter to isLowerLevelType()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060 start');
      let result1 = UTD.getUniformDataTypeByFilenameExtension(".mytext", "general.text");
      let typeObj1 = UTD.getTypeDescriptor(result1);
      try {
        if (typeObj1) {
          let result = typeObj1.isLowerLevelType("");
          console.log(tag + "result==>" + result);
          expect().assertFail();
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1060 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830
     * @tc.desc   getUniformDataTypeByMIMEType --Fuzzy queries parameter --text/*
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830 start');
      try {
        let result = UTD.getUniformDataTypeByMIMEType("text/*");
        console.log(tag + "result=====>" + result);
        expect(result).assertEqual(UTD.UniformDataType.TEXT);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }

      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_0830 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410
     * @tc.desc   Verify the properties of the xhtml file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410 start');
      expect(UTD.UniformDataType.XHTML).assertEqual("general.xhtml");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.XHTML);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.xhtml");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.xml");
        expect(typeObj.description).assertEqual("XHTML");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".xhtml");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/xhtml+xml");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2410 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420
     * @tc.desc   Verify the properties of the rss file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420 start');
      expect(UTD.UniformDataType.RSS).assertEqual("general.rss");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RSS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.rss");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.xml");
        expect(typeObj.description).assertEqual("Rich site summary");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".rss");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/rss+xml");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2420 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430
     * @tc.desc   Verify the properties of the css file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430 start');
      expect(UTD.UniformDataType.CSS).assertEqual("general.css");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CSS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.css");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.script");
        expect(typeObj.description).assertEqual("Cascading style sheets");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".css");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/css");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2430 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440
     * @tc.desc   Verify the properties of the tex file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440 start');
      expect(UTD.UniformDataType.TEX).assertEqual("general.tex");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TEX);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.tex");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.source-code");
        expect(typeObj.description).assertEqual("Base type for TeX source code");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2440 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450
     * @tc.desc   Verify the properties of the asc-text file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450 start');
      expect(UTD.UniformDataType.ASC_TEXT).assertEqual("general.asc-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ASC_TEXT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.asc-text");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.text");
        expect(typeObj.description).assertEqual("ASCII text file");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".asc");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/plain");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2450 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2460
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2460
     * @tc.desc   Verify the properties of the rich-text file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2460 start');
      expect(UTD.UniformDataType.RICH_TEXT).assertEqual("general.rich-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RICH_TEXT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.rich-text");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.text");
        expect(typeObj.description).assertEqual("Rich text format file");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".rtf,.rtx");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/rtf,text/richtext");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2460 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470
     * @tc.desc   Verify the properties of the delimited-values-text file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470 start');
      expect(UTD.UniformDataType.DELIMITED_VALUES_TEXT).assertEqual("general.delimited-values-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DELIMITED_VALUES_TEXT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.delimited-values-text");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.text");
        expect(typeObj.description).assertEqual("Base type for delimited-values text");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2470 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480
     * @tc.desc   Verify the properties of the comma-separated-values-tex file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480 start');
      expect(UTD.UniformDataType.COMMA_SEPARATED_VALUES_TEXT).assertEqual('general.comma-separated-values-text');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.COMMA_SEPARATED_VALUES_TEXT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.comma-separated-values-text');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.delimited-values-text");
        expect(typeObj.description).assertEqual("Comma-separated values file");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".csv");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/csv");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2480 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2490
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2490
     * @tc.desc   Verify the properties of the tab-separated-values-text file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2490 start');
      expect(UTD.UniformDataType.TAB_SEPARATED_VALUES_TEXT).assertEqual("general.tab-separated-values-text");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TAB_SEPARATED_VALUES_TEXT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual("general.tab-separated-values-text");
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.delimited-values-text");
        expect(typeObj.description).assertEqual("Tab-Separated values file");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".tsv");
        expect(typeObj.mimeTypes.toString()).assertEqual("text/tab-separated-values");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2490 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510
     * @tc.desc   Verify the properties of the gif file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510 start');
      expect(UTD.UniformDataType.GIF).assertEqual('general.gif');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.GIF);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.gif');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.image");
        expect(typeObj.description).assertEqual("GIF image");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".gif");
        expect(typeObj.mimeTypes.toString()).assertEqual("image/gif");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2520
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2520
     * @tc.desc   Verify the properties of the com.microsoft.word.dot file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510 start');
      expect(UTD.UniformDataType.WORD_DOT).assertEqual('com.microsoft.word.dot');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORD_DOT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('com.microsoft.word.dot');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Microsoft Word document template");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".dot");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/msword");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2510 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530
     * @tc.desc   Verify the properties of the com.microsoft.powerpoint.pps file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530 start');
      expect(UTD.UniformDataType.POWERPOINT_PPS).assertEqual('com.microsoft.powerpoint.pps');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POWERPOINT_PPS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('com.microsoft.powerpoint.pps');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Microsoft PowerPoint slide show");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".pps");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-powerpoint");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2530 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540
     * @tc.desc   Verify the properties of the com.microsoft.powerpoint.pot file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540 start');
      expect(UTD.UniformDataType.POWERPOINT_POT).assertEqual('com.microsoft.powerpoint.pot');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.POWERPOINT_POT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('com.microsoft.powerpoint.pot');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Microsoft PowerPoint Template");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".pot");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-powerpoint");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2540 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550
     * @tc.desc   Verify the properties of the com.microsoft.excel.xlt file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550 start');
      expect(UTD.UniformDataType.EXCEL_XLT).assertEqual('com.microsoft.excel.xlt');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.EXCEL_XLT);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('com.microsoft.excel.xlt');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Microsoft Excel spreadsheet template");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".xlt");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.ms-excel");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2550 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560
     * @tc.desc   Verify the properties of the com.microsoft.visio.vsd file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560 start');
      expect(UTD.UniformDataType.VISIO_VSD).assertEqual('com.microsoft.visio.vsd');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.VISIO_VSD);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('com.microsoft.visio.vsd');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Microsoft Office Visio 2003-2010 drawing");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".vsd");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/vnd.visio");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2560 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570
     * @tc.desc   Verify the properties of the ts file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570 start');
      expect(UTD.UniformDataType.TS).assertEqual('general.ts');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TS);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.ts');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.video");
        expect(typeObj.description).assertEqual("MPEG transport stream");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".ts");
        expect(typeObj.mimeTypes.toString()).assertEqual("video/mp2ts,video/mp2t");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2570 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580
     * @tc.desc   Verify the properties of the mpegurl-video file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580 start');
      expect(UTD.UniformDataType.MPEGURL_VIDEO).assertEqual('general.mpegurl-video');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEGURL_VIDEO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.mpegurl-video');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.video");
        expect(typeObj.description).assertEqual("Video playlist");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".mxu,.m4u");
        expect(typeObj.mimeTypes.toString()).assertEqual("video/vnd.mpegurl");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2590
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2590
     * @tc.desc   Verify the properties of the org.matroska.mkv file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580 start');
      expect(UTD.UniformDataType.MATROSKA_VIDEO).assertEqual('org.matroska.mkv');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MATROSKA_VIDEO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('org.matroska.mkv');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.video");
        expect(typeObj.description).assertEqual("Matroska video");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".mkv");
        expect(typeObj.mimeTypes.toString()).assertEqual("video/x-matroska");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2580 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610
     * @tc.desc   Verify the properties of the com.adobe.flash file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610 start');
      expect(UTD.UniformDataType.FLASH).assertEqual('com.adobe.flash');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.FLASH);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('com.adobe.flash');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.video");
        expect(typeObj.description).assertEqual("Shockwave flash movie");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".swf,.flv");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/x-shockwave-flash,video/x-flv");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2620
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2620
     * @tc.desc   Verify the properties of the general.mpegurl-audio file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610 start');
      expect(UTD.UniformDataType.MPEGURL_AUDIO).assertEqual('general.mpegurl-audio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEGURL_AUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.mpegurl-audio');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("Audio playlist");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".m3u");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/mpegurl,audio/x-mpegurl");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2610 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630
     * @tc.desc   Verify the properties of the general.mpeg-4-audio file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630 start');
      expect(UTD.UniformDataType.MPEG_4_AUDIO).assertEqual('general.mpeg-4-audio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG_4_AUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.mpeg-4-audio');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("Audio-only MPEG-4 file");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".m4a,.m4b");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/mpeg");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2630 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650
     * @tc.desc   Verify the properties of the mp2 file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650 start');
      expect(UTD.UniformDataType.MP2).assertEqual('general.mp2');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MP2);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.mp2');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("MPEG-1 audio layer II or MPEG-2 audio layer II");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".mp2");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/mpeg");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2650 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640
     * @tc.desc   Verify the properties of the mpeg-audio file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640 start');
      expect(UTD.UniformDataType.MPEG_AUDIO).assertEqual('general.mpeg-audio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MPEG_AUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.mpeg-audio');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("MPEG audio format");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".mpga");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/mpeg");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2640 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660
     * @tc.desc   Verify the properties of the ulaw-audio file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660 start');
      expect(UTD.UniformDataType.ULAW_AUDIO).assertEqual('general.ulaw-audio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ULAW_AUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.ulaw-audio');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("uLaw audio");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".au,.ulw,.snd");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/basic,audio/au,audio/snd");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2660 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670
     * @tc.desc   Verify the properties of the org.matroska.mka file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670 start');
      expect(UTD.UniformDataType.MATROSKA_AUDIO).assertEqual('org.matroska.mka');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.MATROSKA_AUDIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('org.matroska.mka');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.audio");
        expect(typeObj.description).assertEqual("Matroska audio");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".mka");
        expect(typeObj.mimeTypes.toString()).assertEqual("audio/x-matroska");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2670 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2680
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2680
     * @tc.desc   Verify the properties of the opg file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690 start');
      expect(UTD.UniformDataType.OPG).assertEqual('general.opg');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OPG);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.opg');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
        expect(typeObj.description).assertEqual("OPG archive");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".opg");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690
     * @tc.desc   Verify the properties of the taz-archive file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690 start');
      expect(UTD.UniformDataType.TAZ_ARCHIVE).assertEqual('general.taz-archive');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.TAZ_ARCHIVE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.taz-archive');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.tar-archive");
        expect(typeObj.description).assertEqual("Tar zipped file");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".taz,.tar.z,.tz");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/x-gtar");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2690 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710
     * @tc.desc   Verify the properties of the web-archive file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710 start');
      expect(UTD.UniformDataType.WEB_ARCHIVE).assertEqual('general.web-archive');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WEB_ARCHIVE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.web-archive');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
        expect(typeObj.description).assertEqual("MHTML web archive");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".mht,.mhtml");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/x-mimearchive");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2710 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720
     * @tc.desc   Verify the properties of the iso file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720 start');
      expect(UTD.UniformDataType.ISO).assertEqual('general.iso');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.ISO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.iso');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.disk-image");
        expect(typeObj.description).assertEqual("Disc image file");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".iso");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/x-iso9660-image");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2720 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730
     * @tc.desc   Verify the properties of the org.openxmlformats.drawingml.visio file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730 start');
      expect(UTD.UniformDataType.DRAWINGML_VISIO).assertEqual('org.openxmlformats.drawingml.visio');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DRAWINGML_VISIO);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('org.openxmlformats.drawingml.visio');
        expect(typeObj.belongingToTypes.toString()).assertEqual("org.openxmlformats.openxml,general.composite-object");
        expect(typeObj.description).assertEqual("Microsoft Visio drawing");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".vsdx");
        expect(typeObj.mimeTypes.toString())
          .assertEqual("application/vnd.openxmlformats-officedocument.drawingml.drawing");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2740
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2740
     * @tc.desc   Verify the properties of the org.openxmlformats.drawingml.template file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730 start');
      expect(UTD.UniformDataType.DRAWINGML_TEMPLATE).assertEqual('org.openxmlformats.drawingml.template');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.DRAWINGML_TEMPLATE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
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
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2730 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750
     * @tc.desc   Verify the properties of the org.openxmlformats.wordprocessingml.template file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750 start');
      expect(UTD.UniformDataType.WORDPROCESSINGML_TEMPLATE).assertEqual('org.openxmlformats.wordprocessingml.template');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.WORDPROCESSINGML_TEMPLATE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
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
      } else {
        expect().assertFail();
      }  
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2750 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760
     * @tc.desc   Verify the properties of the org.openxmlformats.presentationml.template file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760 start');
      expect(UTD.UniformDataType.PRESENTATIONML_TEMPLATE).assertEqual('org.openxmlformats.presentationml.template');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PRESENTATIONML_TEMPLATE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
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
      } else {
        expect().assertFail();
      }  
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2760 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770
     * @tc.desc   Verify the properties of the org.openxmlformats.presentationml.slideshow file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770 start');
      expect(UTD.UniformDataType.PRESENTATIONML_SLIDESHOW).assertEqual('org.openxmlformats.presentationml.slideshow');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.PRESENTATIONML_SLIDESHOW);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
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
      } else {
        expect().assertFail();
      }  
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2770 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780
     * @tc.desc   Verify the properties of the org.openxmlformats.spreadsheetml.template file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780 start');
      expect(UTD.UniformDataType.SPREADSHEETML_TEMPLATE).assertEqual('org.openxmlformats.spreadsheetml.template');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SPREADSHEETML_TEMPLATE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
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
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2790
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2790
     * @tc.desc   Verify the properties of the com.rarlab.rar-archive file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2780 start');
      expect(UTD.UniformDataType.RAR_ARCHIVE).assertEqual('com.rarlab.rar-archive');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.RAR_ARCHIVE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('com.rarlab.rar-archive');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
        expect(typeObj.description).assertEqual("WinRAR compressed archive");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".rar");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/rar,application/vnd.rar");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2790 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810
     * @tc.desc   Verify the properties of the org.7-zip.7-zip-archive file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810 start');
      expect(UTD.UniformDataType.SEVEN_ZIP_ARCHIVE).assertEqual('org.7-zip.7-zip-archive');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.SEVEN_ZIP_ARCHIVE);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('org.7-zip.7-zip-archive');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.archive");
        expect(typeObj.description).assertEqual("7-zip compressed archive");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".7z");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/x-7z-compressed");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2810 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820
     * @tc.desc   Verify the properties of the general.ofd file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820 start');
      expect(UTD.UniformDataType.OFD).assertEqual('general.ofd');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OFD);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.ofd');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.composite-object");
        expect(typeObj.description).assertEqual("Open fixed-layout document, a national standard for format documents");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual(".ofd");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2820 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830
     * @tc.desc   Verify the properties of the general.cad file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830 start');
      expect(UTD.UniformDataType.CAD).assertEqual('general.cad');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CAD);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.cad');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
        expect(typeObj.description).assertEqual("Base type for computer-aided design");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2830 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840
     * @tc.desc   Verify the properties of the general.octet-stream file format data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840 start');
      expect(UTD.UniformDataType.OCTET_STREAM).assertEqual('general.octet-stream');
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.OCTET_STREAM);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        console.log(tag + "belongingToTypes:" + typeObj.belongingToTypes);
        console.log(tag + "description:" + typeObj.description);
        console.log(tag + "referenceURL:" + typeObj.referenceURL);
        console.log(tag + "iconFile:" + typeObj.iconFile);
        console.log(tag + "filenameExtensions:" + typeObj.filenameExtensions.toString());
        console.log(tag + "mimeTypes:" + typeObj.mimeTypes.toString());
        expect(typeObj.typeId).assertEqual('general.octet-stream');
        expect(typeObj.belongingToTypes.toString()).assertEqual("general.object");
        expect(typeObj.description).assertEqual("Arbitrary binary data");
        expect(typeObj.referenceURL).assertEqual(REFERENCE_URL);
        expect(typeObj.iconFile).assertEqual("");
        expect(typeObj.filenameExtensions.toString()).assertEqual("");
        expect(typeObj.mimeTypes.toString()).assertEqual("application/octet-stream");
      } else {
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_2840 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160
     * @tc.desc   Invalid parameter to getUniformDataTypesByFilenameExtension()  --parameter is ".hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160 start');
      try {
        let dynamicType = UTD.getUniformDataTypesByFilenameExtension(".hello");
        console.log(tag + "UDMF,result=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType[0]);
        if (dynamicTypeObj) {
          console.log(tag + "UDMF,typeId:" + dynamicTypeObj.typeId);
          console.log(tag + "UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
          console.log(tag + "UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
          console.log(tag + "UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
          expect(dynamicTypeObj.typeId).assertEqual(dynamicType[0]);
          expect(dynamicTypeObj.belongingToTypes.length).assertEqual(0);
          expect(dynamicTypeObj.filenameExtensions[0]).assertEqual(".hello");
          expect(dynamicTypeObj.mimeTypes.length).assertEqual(0);
        } else {
          expect().assertFail();
        } 
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1160 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170
     * @tc.desc   Invalid parameter to getUniformDataTypesByFilenameExtension()  --parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170 start');
      try {
        let result = UTD.getUniformDataTypesByFilenameExtension("");
        console.log(tag + "result=====>" + result);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210
     * @tc.desc   Invalid  parameter to getUniformDataTypesByMIMEType() --parameter is "hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210 start');
      try {
        let dynamicType = UTD.getUniformDataTypesByMIMEType("hello");
        console.log(tag + "dynamicType=====>" + dynamicType);
        let dynamicTypeObj = UTD.getTypeDescriptor(dynamicType[0]);
        if (dynamicTypeObj) {
          console.log(tag + "UDMF,typeId:" + dynamicTypeObj.typeId);
          console.log(tag + "UDMF,belongingToTypes:" + dynamicTypeObj.belongingToTypes);
          console.log(tag + "UDMF,filenameExtension:" + dynamicTypeObj.filenameExtensions);
          console.log(tag + "UDMF,mimeTypes:" + dynamicTypeObj.mimeTypes);
          expect(dynamicTypeObj.typeId).assertEqual(dynamicType[0]);
          expect(dynamicTypeObj.belongingToTypes.length).assertEqual(0);
          expect(dynamicTypeObj.mimeTypes[0]).assertEqual("hello");
          expect(dynamicTypeObj.filenameExtensions.length).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1210 end");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250
     * @tc.desc   parameter to getUniformDataTypesByMIMEType()  --parameter are "image/tiff" and "general.type-script"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250 start');
      try {
        let result = UTD.getUniformDataTypesByMIMEType("audio/x-ms-wma", UTD.UniformDataType.WINDOWS_MEDIA_WMA);
        console.log(tag + "result=====>" + result);
        expect(result).assertContain(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1250 end");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1260
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1260
     * @tc.desc   parameter to getTypeDescriptor()  --parameter are "igeneral.content-form"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1260 start');
      expect(UTD.UniformDataType.CONTENT_FORM).assertEqual("general.content-form");
      let typeObj = UTD.getTypeDescriptor(UTD.UniformDataType.CONTENT_FORM);
      if (typeObj) {
        console.log(tag + "typeId:" + typeObj.typeId);
        expect(typeObj.typeId).assertEqual("general.content-form");
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270
     * @tc.desc   parameter to getUniformDataTypesByFilenameExtension()  --parameter is ".xls"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270 start');
      try {
         let result = UTD.getUniformDataTypesByFilenameExtension(".rb", 'general.shell-script');
        console.log(tag + "result=====>" + JSON.stringify(result));
        expect(result).assertContain(UTD.UniformDataType.RUBY_SCRIPT)
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        console.log(tag + "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1270 end");
    });

    /**
     * @tc.name   UDMFUtdTest128
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1280
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest128 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.pages');
        expect(typeId).assertEqual('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest128 end');
    });

    /**
     * @tc.name   UDMFUtdTest129
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1290
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest129 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.pages', 'general.composite-object');
        expect(typeId).assertEqual('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest129 end');
    });

    /**
     * @tc.name   UDMFUtdTest130
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1305
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest130 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.pages', 'com.apple.iwork');
        expect(typeId).assertEqual('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest130 end');
    });

    /**
     * @tc.name   UDMFUtdTest131
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1310
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest131 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.numbers');
        expect(typeId).assertEqual('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest131 end');
    });

    /**
     * @tc.name   UDMFUtdTest132
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1320
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest132 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.numbers', 'general.composite-object');
        expect(typeId).assertEqual('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest132 end');
    });

    /**
     * @tc.name   UDMFUtdTest133
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1330
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest133 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.numbers', 'com.apple.iwork');
        expect(typeId).assertEqual('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest133 end');
    });

    /**
     * @tc.name   UDMFUtdTest134
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1340
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest134 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.key');
        expect(typeId).assertEqual('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest134 end');
    });

    /**
     * @tc.name   UDMFUtdTest135
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1350
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest135 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.key', 'general.composite-object');
        expect(typeId).assertEqual('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest135 end');
    });

    /**
     * @tc.name   UDMFUtdTest136
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1360
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest136 start');
      try {
        let typeId = UTD.getUniformDataTypeByFilenameExtension('.key', 'com.apple.iwork');
        expect(typeId).assertEqual('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypeByFilenameExtension success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest136 end');
    });

    /**
     * @tc.name   UDMFUtdTest137
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1370
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest137 start');
      try {
        let typeObj:UTD.TypeDescriptor | null = UTD.getTypeDescriptor('com.apple.iwork.pages.pages');
        if (typeObj) {
          let typeId = typeObj.typeId;
          let belongingToTypes = typeObj.belongingToTypes;
          let description = typeObj.description;
          let filenameExtensions = typeObj.filenameExtensions;
          let mimeTypes = typeObj.mimeTypes;
          expect(typeId).assertEqual('com.apple.iwork.pages.pages');
          console.log(tag + `typeId: ${typeId}`);
          expect(belongingToTypes[0]).assertEqual('general.composite-object');
          expect(belongingToTypes[1]).assertEqual('com.apple.iwork');
          console.log(tag + `belongingToTypes: ${belongingToTypes}`);
          expect(description).assertEqual('Apple iWork Pages Document File');
          console.log(tag + `description: ${description}`);
          expect(filenameExtensions[0]).assertEqual('.pages');
          console.log(tag + `filenameExtensions: ${filenameExtensions}`);
          expect(mimeTypes[0]).assertEqual('application/vnd.apple.pages');
          console.log(tag + `mimeTypes: ${mimeTypes}`);
        } else {
          console.log(tag + 'type com.apple.iwork.pages.pages does not exist');
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getTypeDescriptor throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest137 end');
    });

    /**
     * @tc.name   UDMFUtdTest138
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1380
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest138 start');
      try {
        let typeObj:UTD.TypeDescriptor | null = UTD.getTypeDescriptor('com.apple.iwork.numbers.numbers');
        if (typeObj) {
          let typeId = typeObj.typeId;
          let belongingToTypes = typeObj.belongingToTypes;
          let description = typeObj.description;
          let filenameExtensions = typeObj.filenameExtensions;
          let mimeTypes = typeObj.mimeTypes;
          expect(typeId).assertEqual('com.apple.iwork.numbers.numbers');
          console.log(tag + `typeId: ${typeId}`);
          expect(belongingToTypes[0]).assertEqual('general.composite-object');
          expect(belongingToTypes[1]).assertEqual('com.apple.iwork');
          console.log(tag + `belongingToTypes: ${belongingToTypes}`);
          expect(description).assertEqual('Apple iWork Numbers Spread Sheet File');
          console.log(tag + `description: ${description}`);
          expect(filenameExtensions[0]).assertEqual('.numbers');
          console.log(tag + `filenameExtensions: ${filenameExtensions}`);
          expect(mimeTypes[0]).assertEqual('application/vnd.apple.numbers');
          console.log(tag + `mimeTypes: ${mimeTypes}`);
        } else {
          console.log(tag + 'type com.apple.iwork.pages.pages does not exist');
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getTypeDescriptor throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest138 end');
    });

    /**
     * @tc.name   UDMFUtdTest139
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1390
     * @tc.desc   getUniformDataTypeByFilenameExtension Suffix is .page com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest139 start');
      try {
        let typeObj:UTD.TypeDescriptor | null = UTD.getTypeDescriptor('com.apple.iwork.keynote.key');
        if (typeObj) {
          let typeId = typeObj.typeId;
          let belongingToTypes = typeObj.belongingToTypes;
          let description = typeObj.description;
          let filenameExtensions = typeObj.filenameExtensions;
          let mimeTypes = typeObj.mimeTypes;
          expect(typeId).assertEqual('com.apple.iwork.keynote.key');
          console.log(tag + `typeId: ${typeId}`);
          expect(belongingToTypes[0]).assertEqual('general.composite-object');
          expect(belongingToTypes[1]).assertEqual('com.apple.iwork');
          console.log(tag + `belongingToTypes: ${belongingToTypes}`);
          expect(description).assertEqual('Apple iWork Keynote Presentation File');
          console.log(tag + `description: ${description}`);
          expect(filenameExtensions[0]).assertEqual('.key');
          console.log(tag + `filenameExtensions: ${filenameExtensions}`);
          expect(mimeTypes[0]).assertEqual('application/vnd.apple.keynote');
          console.log(tag + `mimeTypes: ${mimeTypes}`);
        } else {
          console.log(tag + 'type com.apple.iwork.pages.pages does not exist');
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getTypeDescriptor throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest139 end');
    });

    /**
     * @tc.name   UDMFUtdTest140
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1405
     * @tc.desc   getUniformDataTypeByMIMEType Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest140 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.pages');
        expect(typeId).assertEqual('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest140 end');
    });

    /**
     * @tc.name   UDMFUtdTest141
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1410
     * @tc.desc   getUniformDataTypeByMIMEType with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest141 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.pages', 'general.composite-object');
        expect(typeId).assertEqual('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest141 end');
    });

    /**
     * @tc.name   UDMFUtdTest142
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1420
     * @tc.desc   getUniformDataTypeByMIMEType with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest142 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.pages', 'com.apple.iwork');
        expect(typeId).assertEqual('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest142 end');
    });

    /**
     * @tc.name   UDMFUtdTest143
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1430
     * @tc.desc   getUniformDataTypeByMIMEType Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest143 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.numbers');
        expect(typeId).assertEqual('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest143 end');
    });

    /**
     * @tc.name   UDMFUtdTest144
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1440
     * @tc.desc   getUniformDataTypeByMIMEType with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest144 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.numbers', 'general.composite-object');
        expect(typeId).assertEqual('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest144 end');
    });

    /**
     * @tc.name   UDMFUtdTest145
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1450
     * @tc.desc   getUniformDataTypeByMIMEType with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest145 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.numbers', 'com.apple.iwork');
        expect(typeId).assertEqual('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest145 end');
    });

    /**
     * @tc.name   UDMFUtdTest146
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1460
     * @tc.desc   getUniformDataTypeByMIMEType Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest146 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.keynote');
        expect(typeId).assertEqual('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest146 end');
    });

    /**
     * @tc.name   UDMFUtdTest147
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1470
     * @tc.desc   getUniformDataTypeByMIMEType with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest147 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.keynote', 'general.composite-object');
        expect(typeId).assertEqual('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest147 end');
    });

    /**
     * @tc.name   UDMFUtdTest148
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1480
     * @tc.desc   getUniformDataTypeByMIMEType with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest148 start');
      try {
        let typeId = UTD.getUniformDataTypeByMIMEType('application/vnd.apple.keynote', 'com.apple.iwork');
        expect(typeId).assertEqual('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypeByMIMEType success. typeId: ${typeId}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypeByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest148 end');
    });

    /**
     * @tc.name   UDMFUtdTest149
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1490
     * @tc.desc   getUniformDataTypesByFilenameExtension Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest149 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.pages');
        expect(typeIds).assertContain('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest149 end');
    });

    /**
     * @tc.name   UDMFUtdTest150
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1505
     * @tc.desc   getUniformDataTypesByFilenameExtension with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest150 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.pages', 'general.composite-object');
        expect(typeIds).assertContain('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest150 end');
    });

    /**
     * @tc.name   UDMFUtdTest151
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1510
     * @tc.desc   getUniformDataTypesByFilenameExtension with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest151 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.pages', 'com.apple.iwork');
        expect(typeIds).assertContain('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest151 end');
    });

    /**
     * @tc.name   UDMFUtdTest152
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1520
     * @tc.desc   getUniformDataTypesByFilenameExtension Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest152 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.numbers');
        expect(typeIds).assertContain('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest152 end');
    });

    /**
     * @tc.name   UDMFUtdTest153
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1530
     * @tc.desc   getUniformDataTypesByFilenameExtension with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest153 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.numbers', 'general.composite-object');
        expect(typeIds).assertContain('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest153 end');
    });

    /**
     * @tc.name   UDMFUtdTest154
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1540
     * @tc.desc   getUniformDataTypesByFilenameExtension with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest154 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.numbers', 'com.apple.iwork');
        expect(typeIds).assertContain('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest154 end');
    });

    /**
     * @tc.name   UDMFUtdTest155
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1550
     * @tc.desc   getUniformDataTypesByFilenameExtension Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest155 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.key');
        expect(typeIds).assertContain('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest155 end');
    });

    /**
     * @tc.name   UDMFUtdTest156
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1560
     * @tc.desc   getUniformDataTypesByFilenameExtension with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest156 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.key', 'general.composite-object');
        expect(typeIds).assertContain('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest156 end');
    });

    /**
     * @tc.name   UDMFUtdTest157
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1570
     * @tc.desc   getUniformDataTypesByFilenameExtension with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest157 start');
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.key', 'com.apple.iwork');
        expect(typeIds).assertContain('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypesByFilenameExtension success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest157 end');
    });

    /**
     * @tc.name   UDMFUtdTest158
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1580
     * @tc.desc   getUniformDataTypesByMIMEType Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest158 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.pages');
        expect(typeIds).assertContain('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest158 end');
    });

    /**
     * @tc.name   UDMFUtdTest159
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1590
     * @tc.desc   getUniformDataTypesByMIMEType with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest159 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.pages', 'general.composite-object');
        expect(typeIds).assertContain('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest159 end');
    });

    /**
     * @tc.name   UDMFUtdTest160
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1605
     * @tc.desc   getUniformDataTypesByMIMEType with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest160 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.pages', 'com.apple.iwork');
        expect(typeIds).assertContain('com.apple.iwork.pages.pages');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest160 end');
    });

    /**
     * @tc.name   UDMFUtdTest161
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1610
     * @tc.desc   getUniformDataTypesByMIMEType Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest161 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.numbers');
        expect(typeIds).assertContain('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest161 end');
    });

    /**
     * @tc.name   UDMFUtdTest162
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1620
     * @tc.desc   getUniformDataTypesByMIMEType with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest162 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.numbers', 'general.composite-object');
        expect(typeIds).assertContain('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest162 end');
    });

    /**
     * @tc.name   UDMFUtdTest163
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1630
     * @tc.desc   getUniformDataTypesByMIMEType with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest163 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.numbers', 'com.apple.iwork');
        expect(typeIds).assertContain('com.apple.iwork.numbers.numbers');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest163 end');
    });

    /**
     * @tc.name   UDMFUtdTest164
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1640
     * @tc.desc   getUniformDataTypesByMIMEType Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest164 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.keynote');
        expect(typeIds).assertContain('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest164 end');
    });

    /**
     * @tc.name   UDMFUtdTest165
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1650
     * @tc.desc   getUniformDataTypesByMIMEType with belongingToTypes general.composite-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest165 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.keynote', 'general.composite-object');
        expect(typeIds).assertContain('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest165 end');
    });

    /**
     * @tc.name   UDMFUtdTest166
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1660
     * @tc.desc   getUniformDataTypesByMIMEType with belongingToTypes com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest166 start');
      try {
        let typeIds = UTD.getUniformDataTypesByMIMEType('application/vnd.apple.keynote', 'com.apple.iwork');
        expect(typeIds).assertContain('com.apple.iwork.keynote.key');
        console.log(tag + `getUniformDataTypesByMIMEType success. typeIds: ${typeIds}`);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getUniformDataTypesByMIMEType throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest166 end');
    });

    /**
     * @tc.name   UDMFUtdTest167
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1670
     * @tc.desc   getTypeDescriptor com.apple.iwork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UDMFUtdTest167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'UDMFUtdTest167 start');
      try {
        let typeObj:UTD.TypeDescriptor | null = UTD.getTypeDescriptor('com.apple.iwork');
        if (typeObj) {
          let typeId = typeObj.typeId;
          let belongingToTypes = typeObj.belongingToTypes;
          let description = typeObj.description;
          expect(typeId).assertEqual('com.apple.iwork');
          console.log(tag + `typeId: ${typeId}`);
          expect(belongingToTypes[0]).assertEqual('general.archive');
          console.log(tag + `belongingToTypes: ${belongingToTypes}`);
          expect(description).assertEqual('Apple iWork');
          console.log(tag + `description: ${description}`);
        } else {
          console.log(tag + 'type com.apple.iwork.pages.pages does not exist');
          expect().assertFail();
        }
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag + `getTypeDescriptor throws an exception. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'UDMFUtdTest167 end');
    });
    hilog.info(domain, tag, '%{public}s', 'UDMFApiDescriptorTest end');
  });
}
