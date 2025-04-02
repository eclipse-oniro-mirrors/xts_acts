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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import ddm from '@ohos.data.distributedData';

export default function fieldNodeTest(){
describe('fieldNodeTest', function() {

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreSchemaJsApiTest_0400
     * @tc.name [JS-API8]FieldNode.AppendChild().
     * @tc.desc Test Js Api FieldNode.AppendChild() testcase 001
     */
    it('testAppendChild001', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.AppendChild().
     * @tc.desc Test Js Api FieldNode.AppendChild() testcase 002
     */
    it('testAppendChild002', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.AppendChild().
     * @tc.desc Test Js Api FieldNode.AppendChild() testcase 003
     */
    it('testAppendChild003', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.ToJson().
     * @tc.desc Test Js Api FieldNode.ToJson() testcase 001
     */
    it('testToJson001', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.ToJson().
     * @tc.desc Test Js Api FieldNode.ToJson() testcase 002
     */
    it('testToJson002', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.ToJson().
     * @tc.desc Test Js Api FieldNode.ToJson() testcase 003
     */
    it('testToJson003', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.default.
     * @tc.desc Test Js Api FieldNode.default testcase 001
     */
     it('testdefault001', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.nullable.
     * @tc.desc Test Js Api FieldNode.nullable testcase 001
     */
     it('testnullable001', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.type.STRING
     * @tc.desc Test Js Api FieldNode.type testcase 001
     */
     it('testtype001', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.type.INTEGER
     * @tc.desc Test Js Api FieldNode.type testcase 002
     */
     it('testtype002', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.type.FLOAT
     * @tc.desc Test Js Api FieldNode.type testcase 003
     */
     it('testtype003', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.type.BYTE_ARRAY
     * @tc.desc Test Js Api FieldNode.type testcase 004
     */
     it('testtype004', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.type.BOOLEAN
     * @tc.desc Test Js Api FieldNode.type testcase 005
     */
     it('testtype005', 0, async function(done) {
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
     * @tc.name [JS-API8]FieldNode.type.DOUBLE
     * @tc.desc Test Js Api FieldNode.type testcase 006
     */
     it('testtype006', 0, async function(done) {
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