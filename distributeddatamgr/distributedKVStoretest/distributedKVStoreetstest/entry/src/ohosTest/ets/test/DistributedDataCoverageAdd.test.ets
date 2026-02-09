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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import ddm from '@ohos.data.distributedData';
const TAG = "[Kv_data_Ets_TEST >>>>>> ]"

export default function DistributedDataCoverageAdd(){
  describe('DistributedDataCoverageAdd', () => {
    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_appendChild_0100
     * @tc.name DisdataCoverageAdd_appendChild_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc default is ""
     */
    it('DisdataCoverageAdd_appendChild_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_appendChild_001 begin---------  ');
        let node = new ddm.FieldNode("root");
        let first = new ddm.FieldNode('first');
        first.type = ddm.ValueType.STRING;
        first.nullable = false;
        first.default = "";
        let state = node.appendChild(first);
        console.log(TAG + " appendNode " + JSON.stringify(node) + " state is:" + state);
        expect(state).assertEqual(true);

        first.default = " ";
        let state1 = node.appendChild(first);
        console.log(TAG + " appendNode " + JSON.stringify(node) + " state1 is:" + state1);
        expect(state1).assertEqual(true);

        first.default = '';
        let state2 = node.appendChild(first);
        console.log(TAG + " appendNode " + JSON.stringify(node) + " state2 is:" + state2);
        expect(state2).assertEqual(true);

        first.default = ' ';
        let state3 = node.appendChild(first);
        console.log(TAG + " appendNode " + JSON.stringify(node) + " state2 is:" + state3);
        expect(state3).assertEqual(true);

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_appendChild_0200
     * @tc.name DisdataCoverageAdd_appendChild_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc nullable is true
     */
    it('DisdataCoverageAdd_appendChild_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_appendChild_002 begin---------  ');
        let node = new ddm.FieldNode("root");
        let first = new ddm.FieldNode('first');
        first.type = ddm.ValueType.STRING;
        first.nullable = true;
        first.default = 'first';
        let state = node.appendChild(first);
        console.log(TAG + " appendNode " + JSON.stringify(node) + " state is:" + state);
        expect(state).assertEqual(true)
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_appendChild_0300
     * @tc.name DisdataCoverageAdd_appendChild_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc nullable is false
     */
    it('DisdataCoverageAdd_appendChild_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_appendChild_003 begin---------  ');
        let node = new ddm.FieldNode("root");
        let first = new ddm.FieldNode('first');
        first.type = ddm.ValueType.STRING;
        first.nullable = false;
        first.default = 'first';
        let state = node.appendChild(first);
        console.log(TAG + " appendNode " + JSON.stringify(node) + " state is:" + state);
        expect(state).assertEqual(true)
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_appendChild_0400
     * @tc.name DisdataCoverageAdd_appendChild_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_appendChild_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_appendChild_004 begin---------  ');
        let node = new ddm.FieldNode("root");
        let state = node.appendChild(null);
        console.log(TAG + " appendNode " + JSON.stringify(node) + " state is:" + state);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");;
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_appendChild_0500
     * @tc.name DisdataCoverageAdd_appendChild_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_appendChild_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_appendChild_005 begin---------  ');
        let node = new ddm.FieldNode("root");
        let state = node.appendChild(undefined);
        console.log(TAG + " appendNode " + JSON.stringify(node) + " state is:" + state);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_reset_0100
     * @tc.name DisdataCoverageAdd_reset_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc reset add retuenvalue assert
     */
    it('DisdataCoverageAdd_reset_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_reset_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query.equalTo("test", 3);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
        let query1 = query.reset();
        expect("").assertEqual(query1.getSqlLike());
        console.info(TAG +"query is " + query1.getSqlLike());
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_equalTo_0100
     * @tc.name DisdataCoverageAdd_equalTo_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_equalTo_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_equalTo_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.equalTo("", 3);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_equalTo_0200
     * @tc.name DisdataCoverageAdd_equalTo_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_equalTo_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_equalTo_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.equalTo(null, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_equalTo_0300
     * @tc.name DisdataCoverageAdd_equalTo_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_equalTo_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_equalTo_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.equalTo(undefined, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_equalTo_0400
     * @tc.name DisdataCoverageAdd_equalTo_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_equalTo_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_equalTo_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.equalTo("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_equalTo_0500
     * @tc.name DisdataCoverageAdd_equalTo_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_equalTo_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_equalTo_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.equalTo("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_equalTo_0600
     * @tc.name DisdataCoverageAdd_equalTo_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('DisdataCoverageAdd_equalTo_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_equalTo_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.equalTo("field", "");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_equalTo_0700
     * @tc.name DisdataCoverageAdd_equalTo_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is true
     */
    it('DisdataCoverageAdd_equalTo_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_equalTo_007 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.equalTo("field", true);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notEqualTo_0100
     * @tc.name DisdataCoverageAdd_notEqualTo_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_notEqualTo_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notEqualTo_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notEqualTo("", 3);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notEqualTo_0200
     * @tc.name DisdataCoverageAdd_notEqualTo_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_notEqualTo_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notEqualTo_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notEqualTo(null, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notEqualTo_0300
     * @tc.name DisdataCoverageAdd_notEqualTo_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_notEqualTo_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notEqualTo_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notEqualTo(undefined, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notEqualTo_0400
     * @tc.name DisdataCoverageAdd_notEqualTo_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_notEqualTo_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notEqualTo_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notEqualTo("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notEqualTo_0500
     * @tc.name DisdataCoverageAdd_notEqualTo_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_notEqualTo_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notEqualTo_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notEqualTo("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notEqualTo_0600
     * @tc.name DisdataCoverageAdd_notEqualTo_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('DisdataCoverageAdd_notEqualTo_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notEqualTo_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notEqualTo("field", "");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notEqualTo_0700
     * @tc.name DisdataCoverageAdd_notEqualTo_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is true
     */
    it('DisdataCoverageAdd_notEqualTo_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notEqualTo_007 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notEqualTo("field", true);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThan_0100
     * @tc.name DisdataCoverageAdd_greaterThan_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_greaterThan_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThan_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThan("", 3);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThan_0200
     * @tc.name DisdataCoverageAdd_greaterThan_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_greaterThan_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThan_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThan(null, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThan_0300
     * @tc.name DisdataCoverageAdd_greaterThan_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_greaterThan_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThan_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThan(undefined, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThan_0400
     * @tc.name DisdataCoverageAdd_greaterThan_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_greaterThan_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThan_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThan("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThan_0500
     * @tc.name DisdataCoverageAdd_greaterThan_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_greaterThan_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThan_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThan("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThan_0600
     * @tc.name DisdataCoverageAdd_greaterThan_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('DisdataCoverageAdd_greaterThan_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThan_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThan("field", "");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThan_0700
     * @tc.name DisdataCoverageAdd_greaterThan_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is false
     */
    it('DisdataCoverageAdd_greaterThan_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThan_007 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThan("field", false);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThan_0100
     * @tc.name DisdataCoverageAdd_lessThan_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_lessThan_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThan_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThan("", 3);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThan_0200
     * @tc.name DisdataCoverageAdd_lessThan_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_lessThan_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThan_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThan(null, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThan_0300
     * @tc.name DisdataCoverageAdd_lessThan_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_lessThan_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThan_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThan(undefined, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThan_0400
     * @tc.name DisdataCoverageAdd_lessThan_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_lessThan_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThan_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThan("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThan_0500
     * @tc.name DisdataCoverageAdd_lessThan_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_lessThan_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThan_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThan("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThan_0600
     * @tc.name DisdataCoverageAdd_lessThan_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('DisdataCoverageAdd_lessThan_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThan_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThan("field", "");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThanOrEqualTo_0100
     * @tc.name DisdataCoverageAdd_greaterThanOrEqualTo_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_greaterThanOrEqualTo_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThanOrEqualTo_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThanOrEqualTo("", 3);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThanOrEqualTo_0200
     * @tc.name DisdataCoverageAdd_greaterThanOrEqualTo_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_greaterThanOrEqualTo_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThanOrEqualTo_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThanOrEqualTo(null, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThanOrEqualTo_0300
     * @tc.name DisdataCoverageAdd_greaterThanOrEqualTo_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_greaterThanOrEqualTo_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThanOrEqualTo_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThanOrEqualTo(undefined, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThanOrEqualTo_0400
     * @tc.name DisdataCoverageAdd_greaterThanOrEqualTo_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_greaterThanOrEqualTo_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThanOrEqualTo_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThanOrEqualTo("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThanOrEqualTo_0500
     * @tc.name DisdataCoverageAdd_greaterThanOrEqualTo_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_greaterThanOrEqualTo_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThanOrEqualTo_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThanOrEqualTo("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_greaterThanOrEqualTo_0600
     * @tc.name DisdataCoverageAdd_greaterThanOrEqualTo_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('DisdataCoverageAdd_greaterThanOrEqualTo_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_greaterThanOrEqualTo_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.greaterThanOrEqualTo("field", "");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThanOrEqualTo_0100
     * @tc.name DisdataCoverageAdd_lessThanOrEqualTo_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_lessThanOrEqualTo_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThanOrEqualTo_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThanOrEqualTo("", 3);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThanOrEqualTo_0200
     * @tc.name DisdataCoverageAdd_lessThanOrEqualTo_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_lessThanOrEqualTo_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThanOrEqualTo_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThanOrEqualTo(null, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThanOrEqualTo_0300
     * @tc.name DisdataCoverageAdd_lessThanOrEqualTo_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_lessThanOrEqualTo_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThanOrEqualTo_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThanOrEqualTo(undefined, 3);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThanOrEqualTo_0400
     * @tc.name DisdataCoverageAdd_lessThanOrEqualTo_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_lessThanOrEqualTo_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThanOrEqualTo_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThanOrEqualTo("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThanOrEqualTo_0500
     * @tc.name DisdataCoverageAdd_lessThanOrEqualTo_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_lessThanOrEqualTo_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThanOrEqualTo_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThanOrEqualTo("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_lessThanOrEqualTo_0600
     * @tc.name DisdataCoverageAdd_lessThanOrEqualTo_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('DisdataCoverageAdd_lessThanOrEqualTo_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_lessThanOrEqualTo_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.lessThanOrEqualTo("field", "");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_isNull_0100
     * @tc.name DisdataCoverageAdd_isNull_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_isNull_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_isNull_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.isNull("");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_isNull_0200
     * @tc.name DisdataCoverageAdd_isNull_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_isNull_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_isNull_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.isNull(null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_isNull_0300
     * @tc.name DisdataCoverageAdd_isNull_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_isNull_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_isNull_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.isNull(undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inNumber_0100
     * @tc.name DisdataCoverageAdd_inNumber_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_inNumber_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inNumber_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inNumber("", [0, 1]);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inNumber_0200
     * @tc.name DisdataCoverageAdd_inNumber_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_inNumber_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inNumber_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inNumber(null, [0, 1]);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inNumber_0300
     * @tc.name DisdataCoverageAdd_inNumber_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_inNumber_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inNumber_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inNumber(undefined, [0, 1]);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inNumber_0400
     * @tc.name DisdataCoverageAdd_inNumber_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_inNumber_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inNumber_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inNumber("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inNumber_0500
     * @tc.name DisdataCoverageAdd_inNumber_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_inNumber_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inNumber_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inNumber("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inNumber_0600
     * @tc.name DisdataCoverageAdd_inNumber_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is []
     */
    it('DisdataCoverageAdd_inNumber_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inNumber_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inNumber("field", []);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inString_0100
     * @tc.name DisdataCoverageAdd_inString_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_inString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inString_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inString("", ['test1', 'test2']);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inString_0200
     * @tc.name DisdataCoverageAdd_inString_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_inString_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inString_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inString(null, ['test1', 'test2']);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inString_0300
     * @tc.name DisdataCoverageAdd_inString_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_inString_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inString_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inString(undefined, ['test1', 'test2']);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inString_0400
     * @tc.name DisdataCoverageAdd_inString_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_inString_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inString_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inString("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inString_0500
     * @tc.name DisdataCoverageAdd_inString_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_inString_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inString_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inString("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_inString_0600
     * @tc.name DisdataCoverageAdd_inString_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is []
     */
    it('DisdataCoverageAdd_inString_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_inString_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.inString("field", []);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInNumber_0100
     * @tc.name DisdataCoverageAdd_notInNumber_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_notInNumber_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInNumber_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInNumber("", [0, 1]);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInNumber_0200
     * @tc.name DisdataCoverageAdd_notInNumber_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_notInNumber_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInNumber_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInNumber(null, [0, 1]);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInNumber_0300
     * @tc.name DisdataCoverageAdd_notInNumber_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_notInNumber_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInNumber_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInNumber(undefined, [0, 1]);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInNumber_0400
     * @tc.name DisdataCoverageAdd_notInNumber_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_notInNumber_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInNumber_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInNumber("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInNumber_0500
     * @tc.name DisdataCoverageAdd_notInNumber_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_notInNumber_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInNumber_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInNumber("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInNumber_0600
     * @tc.name DisdataCoverageAdd_notInNumber_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is []
     */
    it('DisdataCoverageAdd_notInNumber_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInNumber_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInNumber("field", []);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);

        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInString_0100
     * @tc.name DisdataCoverageAdd_notInString_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_notInString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInString_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInString("", ['test1', 'test2']);
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInString_0200
     * @tc.name DisdataCoverageAdd_notInString_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_notInString_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInString_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInString(null, ['test1', 'test2']);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInString_0300
     * @tc.name DisdataCoverageAdd_notInString_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_notInString_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInString_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInString(undefined, ['test1', 'test2']);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInString_0400
     * @tc.name DisdataCoverageAdd_notInString_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_notInString_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInString_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInString("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInString_0500
     * @tc.name DisdataCoverageAdd_notInString_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_notInString_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInString_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInString("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_notInString_0600
     * @tc.name DisdataCoverageAdd_notInString_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is []
     */
    it('DisdataCoverageAdd_notInString_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_notInString_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.notInString("field", []);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);

        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_like_0100
     * @tc.name DisdataCoverageAdd_like_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_like_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_like_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.like("", "value");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_like_0200
     * @tc.name DisdataCoverageAdd_like_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_like_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_like_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.like(null, "value");
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_like_0300
     * @tc.name DisdataCoverageAdd_like_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_like_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_like_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.like(undefined, "value");
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_like_0400
     * @tc.name DisdataCoverageAdd_like_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_like_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_like_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.like("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_like_0500
     * @tc.name DisdataCoverageAdd_like_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_like_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_like_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.like("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_like_0600
     * @tc.name DisdataCoverageAdd_like_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('DisdataCoverageAdd_like_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_like_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.like("field", "");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })
    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_unlike_0100
     * @tc.name DisdataCoverageAdd_unlike_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_unlike_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_unlike_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.unlike("", "value");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_unlike_0200
     * @tc.name DisdataCoverageAdd_unlike_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_unlike_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_unlike_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.unlike(null, "value");
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_unlike_0300
     * @tc.name DisdataCoverageAdd_unlike_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_unlike_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_unlike_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.unlike(undefined, "value");
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_unlike_0400
     * @tc.name DisdataCoverageAdd_unlike_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_unlike_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_unlike_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.unlike("field", null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_unlike_0500
     * @tc.name DisdataCoverageAdd_unlike_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_unlike_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_unlike_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.unlike("field", undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_unlike_0600
     * @tc.name DisdataCoverageAdd_unlike_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('DisdataCoverageAdd_unlike_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_unlike_006 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.unlike("field", "");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_and_0100
     * @tc.name DisdataCoverageAdd_and_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc return vale add assert
     */
    it('DisdataCoverageAdd_and_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_and_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.and();
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_or_0100
     * @tc.name DisdataCoverageAdd_or_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc return vale add assert
     */
    it('DisdataCoverageAdd_or_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_or_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.or();
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_orderByAsc_0100
     * @tc.name DisdataCoverageAdd_orderByAsc_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_orderByAsc_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_orderByAsc_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.orderByAsc("");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_orderByAsc_0200
     * @tc.name DisdataCoverageAdd_orderByAsc_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_orderByAsc_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_orderByAsc_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.orderByAsc(null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_orderByAsc_0300
     * @tc.name DisdataCoverageAdd_orderByAsc_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_orderByAsc_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_orderByAsc_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.orderByAsc(undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_orderByDesc_0100
     * @tc.name DisdataCoverageAdd_orderByDesc_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_orderByDesc_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_orderByDesc_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.orderByDesc("");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_orderByDesc_0200
     * @tc.name DisdataCoverageAdd_orderByDesc_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_orderByDesc_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_orderByDesc_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.orderByDesc(null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_orderByDesc_0300
     * @tc.name DisdataCoverageAdd_orderByDesc_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_orderByDesc_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_orderByDesc_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.orderByDesc(undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_limit_0100
     * @tc.name DisdataCoverageAdd_limit_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_limit_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_limit_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.limit(null, 1);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_limit_0200
     * @tc.name DisdataCoverageAdd_limit_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_limit_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_limit_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.limit(undefined, 1);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_limit_0300
     * @tc.name DisdataCoverageAdd_limit_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('DisdataCoverageAdd_limit_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_limit_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.limit(10, null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_limit_0400
     * @tc.name DisdataCoverageAdd_limit_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('DisdataCoverageAdd_limit_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_limit_004 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.limit(10, undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_limit_0500
     * @tc.name DisdataCoverageAdd_limit_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc retuen value add assert
     */
    it('DisdataCoverageAdd_limit_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_limit_005 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.limit(10, 1);
        console.info(TAG +"query.getSqlLike is " + query.getSqlLike());
        expect(query !== null).assertTrue();
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_isNotNull_0100
     * @tc.name DisdataCoverageAdd_isNotNull_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_isNotNull_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_isNotNull_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.isNotNull("");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_isNotNull_0200
     * @tc.name DisdataCoverageAdd_isNotNull_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_isNotNull_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_isNotNull_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.isNotNull(null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_isNotNull_0300
     * @tc.name DisdataCoverageAdd_isNotNull_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_isNotNull_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_isNotNull_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.isNotNull(undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_beginGroup_0100
     * @tc.name DisdataCoverageAdd_beginGroup_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc return vale add assert
     */
    it('DisdataCoverageAdd_beginGroup_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_beginGroup_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.beginGroup();
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_endGroup_0100
     * @tc.name DisdataCoverageAdd_endGroup_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc return vale add assert
     */
    it('DisdataCoverageAdd_endGroup_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_endGroup_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.endGroup();
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() !== "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_prefixKey_0100
     * @tc.name DisdataCoverageAdd_prefixKey_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_prefixKey_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_prefixKey_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.prefixKey("");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_prefixKey_0200
     * @tc.name DisdataCoverageAdd_prefixKey_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_prefixKey_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_prefixKey_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.prefixKey(null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_prefixKey_0300
     * @tc.name DisdataCoverageAdd_prefixKey_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_prefixKey_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_prefixKey_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.prefixKey(undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_setSuggestIndex_0100
     * @tc.name DisdataCoverageAdd_setSuggestIndex_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_setSuggestIndex_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_setSuggestIndex_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.setSuggestIndex("");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_setSuggestIndex_0200
     * @tc.name DisdataCoverageAdd_setSuggestIndex_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_setSuggestIndex_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_setSuggestIndex_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.setSuggestIndex(null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_setSuggestIndex_0300
     * @tc.name DisdataCoverageAdd_setSuggestIndex_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_setSuggestIndex_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_setSuggestIndex_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.setSuggestIndex(undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_deviceId_0100
     * @tc.name DisdataCoverageAdd_deviceId_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('DisdataCoverageAdd_deviceId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_deviceId_001 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.deviceId("");
        console.info(TAG +"query is " + query.getSqlLike());
        expect(query.getSqlLike() === "").assertTrue();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_deviceId_0200
     * @tc.name DisdataCoverageAdd_deviceId_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('DisdataCoverageAdd_deviceId_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_deviceId_002 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.deviceId(null);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisdataCoverageAdd_deviceId_0300
     * @tc.name DisdataCoverageAdd_deviceId_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('DisdataCoverageAdd_deviceId_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        console.info(TAG + ' --------- DisdataCoverageAdd_deviceId_003 begin---------  ');
        let query = new ddm.Query();
        expect("").assertEqual(query.getSqlLike());
        query = query.deviceId(undefined);
        expect(null).assertFail();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(undefined);
        expect(e.message).assertContain("failed: invalid arguments");
      }
    })
    console.info(TAG + '-------------------describe DisdataCoverageAdd  end-------------------');
  })
}