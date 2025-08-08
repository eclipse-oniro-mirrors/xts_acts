/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import ddm from '@ohos.data.distributedData';

export default function fieldNodeTest(){
describe('fieldNodeTest', function() {

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0400
     * @tc.name testAppendChild001
     * @tc.desc Test Js Api FieldNode.AppendChild() testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testAppendChild001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child1 = new ddm.FieldNode("child1");
            let child2 = new ddm.FieldNode("child2");
            let child3 = new ddm.FieldNode("child3");
            node.appendChild(child1);
            node.appendChild(child2);
            node.appendChild(child3);
            child1 = null;
            child2 = null;
            child3 = null;
            node = null;
        } catch (e) {
            console.info("testAppendChild001 " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0100
     * @tc.name testAppendChild002
     * @tc.desc Test Js Api FieldNode.AppendChild() testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testAppendChild002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child = new ddm.FieldNode("child");
            node.appendChild(child);
            child = null;
            node = null;
        } catch (e) {
            console.info("testAppendChild002 " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0600
     * @tc.name testAppendChild003
     * @tc.desc Test Js Api FieldNode.AppendChild() testcase 003
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testAppendChild003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child = new ddm.FieldNode();
            node.appendChild(child);
            expect(null).assertFail();
        } catch (e) {
            console.info("testAppendChild003 is ok :" + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0500
     * @tc.name testToJson001
     * @tc.desc Test Js Api FieldNode.ToJson() testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testToJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child = new ddm.FieldNode("child");
            node.appendChild(child);
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0200
     * @tc.name testToJson002
     * @tc.desc Test Js Api FieldNode.ToJson() testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testToJson002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child = new ddm.FieldNode("child");
            node.appendChild(child);
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0300
     * @tc.name testToJson003
     * @tc.desc Test Js Api FieldNode.ToJson() testcase 003
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testToJson003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode();
            let child = new ddm.FieldNode();
            node.appendChild(child);
            expect(null).assertFail();
        } catch (e) {
            console.info("testToJson003 is ok : " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0700
     * @tc.name testdefault001
     * @tc.desc Test Js Api FieldNode.default testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('testdefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode('first');
            node.default = 'first name';
            console.info('defaultValue = ' + node.default);
            expect(node.default === 'first name').assertTrue()
        } catch (e) {
            console.info("testdefault001 fail on exception: " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0800
     * @tc.name testnullable001
     * @tc.desc Test Js Api FieldNode.nullable testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('testnullable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode('first');
            node.nullable = false;
            console.info('nullable = ' + node.nullable);
            expect(node.nullable === false).assertTrue()
        } catch (e) {
            console.info("testnullable001 fail on exception: " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_1400
     * @tc.name testtype001
     * @tc.desc Test Js Api FieldNode.type testcase 001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('testtype001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode('first');
            node.type = ddm.ValueType.STRING;
            console.info('testtype001 type = ' + node.type);
            expect(node.type === ddm.ValueType.STRING).assertTrue();
        } catch (e) {
            console.info("testtype001 fail on exception: " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_1300
     * @tc.name testtype002
     * @tc.desc Test Js Api FieldNode.type testcase 002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('testtype002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode('first');
            node.type = ddm.ValueType.INTEGER;
            console.info('testtype002 type = ' + node.type);
            expect(node.type === ddm.ValueType.INTEGER).assertTrue();
        } catch (e) {
            console.info("testtype002 fail on exception: " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_1200
     * @tc.name testtype003
     * @tc.desc Test Js Api FieldNode.type testcase 003
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('testtype003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode('first');
            node.type = ddm.ValueType.FLOAT;
            console.info('testtype003 type = ' + node.type);
            expect(node.type === ddm.ValueType.FLOAT).assertTrue();
        } catch (e) {
            console.info("testtype003 fail on exception: " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_1000
     * @tc.name testtype004
     * @tc.desc Test Js Api FieldNode.type testcase 004
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('testtype004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode('first');
            node.type = ddm.ValueType.BYTE_ARRAY;
            console.info('testtype004 type = ' + node.type);
            expect(node.type === ddm.ValueType.BYTE_ARRAY).assertTrue();
        } catch (e) {
            console.info("testtype004 fail on exception: " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0900
     * @tc.name testtype005
     * @tc.desc Test Js Api FieldNode.type testcase 005
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('testtype005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode('first');
            node.type = ddm.ValueType.BOOLEAN;
            console.info('testtype005 type = ' + node.type);
            expect(node.type === ddm.ValueType.BOOLEAN).assertTrue();
        } catch (e) {
            console.info("testtype005 fail on exception: " + e);
            expect(null).assertFail();

        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_1100
     * @tc.name testtype006
     * @tc.desc Test Js Api FieldNode.type testcase 006
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
     it('testtype006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
        try {
            let node = new ddm.FieldNode('first');
            node.type = ddm.ValueType.DOUBLE;
            console.info('testtype006 type = ' + node.type);
            expect(node.type === ddm.ValueType.DOUBLE).assertTrue();
        } catch (e) {
            console.info("testtype006 fail on exception: " + e);
            expect(null).assertFail();
        }
        done();
    })
})
}