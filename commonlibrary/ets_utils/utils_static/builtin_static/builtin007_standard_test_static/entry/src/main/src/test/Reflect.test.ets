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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';

// Test classes for reflect module
interface MyInterface {
    name: string;
    age: int;
}

class MyClass implements MyInterface {
    public name: string = 'Bob';
    public age: int = 25;
}

class BaseClass {
    private _baseField: string = '';

    public get baseField(): string {
        return this._baseField;
    }

    public set baseField(value: string) {
        this._baseField = value;
    }
}

class DerivedClass extends BaseClass {
    private _name: string = '';
    private _age: int = 0;

    public get name(): string {
        return this._name;
    }

    public set name(value: string) {
        this._name = value;
    }

    public get age(): int {
        return this._age;
    }

    public set age(value: int) {
        this._age = value;
    }
}

async function asyncFunc() {
    console.log('async function');
}

function syncFunc() {
    console.log('sync function');
}

class FieldTestClass {
    public name: string = 'test';
    public readonly readonlyField: string = 'readonly';
    public count: int = 0;
    public static remark = 'remark';
    public static readonly staticReadonlyField: string = 'readonly';
    private privateField: string = 'private';
}

class MethodTestClass {
    private static _name: string = '';

    public static get name(): string {
        return MethodTestClass._name;
    }

    public static set name(value: string) {
        MethodTestClass._name = value;
    }

    public test(): string {
        return 'no param';
    }

    public test(msg: string): string {
        return msg;
    }

    public static staticTest(msg: string): string {
        return msg;
    }

    public final finalMethod(): void {
        console.log('final');
    }

    public async asyncMethod(): Promise<void> {
        console.log('async method');
        return Promise.resolve();
    }

    public static async staticAsyncMethod(): Promise<void> {
        console.log('async method');
        return Promise.resolve();
    }

    private privateMethod(): string {
        return 'private';
    }
}

abstract class AbstractMethodClass {
    public abstract abstractMethod(): void;
}

class TestBase {
    public baseField: string = 'base';
}

class TestDerived extends TestBase {
    public name: string = 'Alice';
    public age: int = 30;
}

class TestCtor {
    public name: string = 'name';
    public constructor() {
        this.name = 'default';
    }

    public constructor(name : string) {
        this.name = name
    }
}

// InvocationHandler implementation for Proxy tests
class MyHandler implements reflect.InvocationHandler {
    target: Object;

    public constructor(other: Object) {
        this.target = other;
    }

    public get(proxy: reflect.Proxy, method: reflect.InstanceMethod): Any {
        return method.invoke(this.target);
    }

    public set(proxy: reflect.Proxy, method: reflect.InstanceMethod, value: Any): void {
        method.invoke(this.target, [value]);
    }

    public invoke(proxy: reflect.Proxy, method: reflect.InstanceMethod, args: FixedArray<Any>): Any {
        if ((proxy instanceof ProxyInterface) && method.getName() === 'test'
            && method.getParametersNum() == 1) {
            let newArgs = new FixedArray<Any>(1);
            newArgs[0] = 'hellow: ' + (args[0] as string);
            return method.invoke(this.target, newArgs)
        }
        return method.invoke(this.target, args);
    }
}

interface ProxyInterface {
    name: string;
    age: int;
    test(msg: string): string;
}

class ProxyTarget implements ProxyInterface {
    public name: string = '';
    public age: int = 0;
    public msg: string = '';

    public test(msg: string): string {
        this.msg = msg;
        return msg;
    }
}

export default function reflectTest() {
    describe('ReflectTest', (): void => {
        beforeAll(() => {
        })

        beforeEach(async (): Promise<void> => {
            await Utils.msSleep(100);
        })

        afterEach(() => {
        })

        afterAll(() => {
        })

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_ISLITERALINITIALIZEDINTERFACE_0100
         * @tc.name    testReflectIsLiteralInitializedInterface0001
         * @tc.desc    Verify isLiteralInitializedInterface returns true for literal
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectIsLiteralInitializedInterface0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectIsLiteralInitializedInterface0001';
            try {
                let obj1: MyInterface = { name: 'Alice', age: 30 };
                expect(reflect.isLiteralInitializedInterface(obj1)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_ISLITERALINITIALIZEDINTERFACE_0200
         * @tc.name    testReflectIsLiteralInitializedInterface0002
         * @tc.desc    Verify isLiteralInitializedInterface returns false for class instance
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectIsLiteralInitializedInterface0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectIsLiteralInitializedInterface0002';
            try {
                let obj2: MyInterface = new MyClass();
                expect(reflect.isLiteralInitializedInterface(obj2)).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_ISFUNCOBJASYNC_0100
         * @tc.name    testReflectIsFuncObjAsync0001
         * @tc.desc    Verify isFuncObjAsync returns true for async function
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectIsFuncObjAsync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectIsFuncObjAsync0001';
            try {
                expect(reflect.isFuncObjAsync(asyncFunc)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_ISFUNCOBJASYNC_0200
         * @tc.name    testReflectIsFuncObjAsync0002
         * @tc.desc    Verify isFuncObjAsync returns false for sync function
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectIsFuncObjAsync0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectIsFuncObjAsync0002';
            try {
                expect(reflect.isFuncObjAsync(syncFunc)).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_GETINSTANCEGETTERSRECURSIVE_0100
         * @tc.name    testReflectGetInstanceGettersRecursive0001
         * @tc.desc    Verify getInstanceGettersRecursive returns all getters
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectGetInstanceGettersRecursive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectGetInstanceGettersRecursive0001';
            try {
                let cls = Class.from<DerivedClass>();
                let getters = reflect.getInstanceGettersRecursive(cls);
                expect(getters.length).assertEqual(3)
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_GETINSTANCEFIELDSRECURSIVE_0100
         * @tc.name    testReflectGetInstanceFieldsRecursive0001
         * @tc.desc    Verify getInstanceFieldsRecursive returns all fields including parent
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectGetInstanceFieldsRecursive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectGetInstanceFieldsRecursive0001';
            try {
                let cls = Class.from<TestDerived>();
                let fields = reflect.getInstanceFieldsRecursive(cls);
                expect(fields.length).assertEqual(3);
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_ISREADONLY_0100
         * @tc.name    testReflectInstanceFieldIsReadonly0001
         * @tc.desc    Verify isReadonly for readonly field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldIsReadonly0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldIsReadonly0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('readonlyField');
                expect(field != undefined).assertTrue();
                expect(field!.isReadonly()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_ISPUBLIC_0100
         * @tc.name    testReflectInstanceFieldIsPublic0001
         * @tc.desc    Verify isPublic returns true for public field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldIsPublic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldIsPublic0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                expect(field!.isPublic()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_ISPRIVATE_0100
         * @tc.name    testReflectInstanceFieldIsPrivate0001
         * @tc.desc    Verify isPrivate returns false for public field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldIsPrivate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldIsPrivate0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                expect(field!.isPrivate()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_ISPROTECTED_0100
         * @tc.name    testReflectInstanceFieldIsProtected0001
         * @tc.desc    Verify isProtected returns false for public field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldIsProtected0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldIsProtected0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                expect(field!.isProtected()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_GETTYPE_0100
         * @tc.name    testReflectInstanceFieldGetType0001
         * @tc.desc    Verify getType returns field type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldGetType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldGetType0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                let fieldType = field!.getType();
                expect(fieldType.getName()).assertEqual('std.core.String');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_GETOWNER_0100
         * @tc.name    testReflectInstanceFieldGetOwner0001
         * @tc.desc    Verify getOwner returns owning class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldGetOwner0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldGetOwner0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                expect(field!.getOwner().getName()).assertEqual(cls.getName());
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_GETNAME_0100
         * @tc.name    testReflectInstanceFieldGetName0001
         * @tc.desc    Verify getName returns field name
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldGetName0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                expect(field!.getName()).assertEqual('name');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_EQUALS_0100
         * @tc.name    testReflectInstanceFieldEquals0001
         * @tc.desc    Verify equals for InstanceField
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldEquals0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field1 = cls.getInstanceField('name');
                let field2 = cls.getInstanceField('name');
                expect(field1 != undefined && field2 != undefined).assertTrue();
                expect(field1!.equals(field2!)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_GETVALUE_0100
         * @tc.name    testReflectInstanceFieldGetValue0001
         * @tc.desc    Verify getValue reads field value
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldGetValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldGetValue0001';
            try {
                let obj = new FieldTestClass();
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                let value = field!.getValue(obj);
                expect(value as string).assertEqual(obj.name);
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEFIELD_SETVALUE_0100
         * @tc.name    testReflectInstanceFieldSetValue0001
         * @tc.desc    Verify setValue writes field value
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceFieldSetValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceFieldSetValue0001';
            try {
                let obj = new FieldTestClass();
                let cls = Class.from<FieldTestClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                field!.setValue(obj, 'new value');
                expect(obj.name).assertEqual('new value');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_ISREADONLY_0100
         * @tc.name    testReflectStaticFieldIsReadonly0001
         * @tc.desc    Verify isReadonly for readonly field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldIsReadonly0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldIsReadonly0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('staticReadonlyField');
                expect(field != undefined).assertTrue();
                expect(field!.isReadonly()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_ISPUBLIC_0100
         * @tc.name    testReflectStaticFieldIsPublic0001
         * @tc.desc    Verify isPublic returns true for public field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldIsPublic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldIsPublic0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('remark');
                expect(field != undefined).assertTrue();
                expect(field!.isPublic()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_ISPRIVATE_0100
         * @tc.name    testReflectStaticFieldIsPrivate0001
         * @tc.desc    Verify isPrivate returns false for public field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldIsPrivate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldIsPrivate0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('remark');
                expect(field != undefined).assertTrue();
                expect(field!.isPrivate()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_ISPROTECTED_0100
         * @tc.name    testReflectStaticFieldIsProtected0001
         * @tc.desc    Verify isProtected returns false for public field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldIsProtected0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldIsProtected0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('remark');
                expect(field != undefined).assertTrue();
                expect(field!.isProtected()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_GETTYPE_0100
         * @tc.name    testReflectStaticFieldGetType0001
         * @tc.desc    Verify getType returns field type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldGetType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldGetType0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('remark');
                expect(field != undefined).assertTrue();
                let fieldType = field!.getType();
                expect(fieldType.getName()).assertEqual('std.core.String');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_GETOWNER_0100
         * @tc.name    testReflectStaticFieldGetOwner0001
         * @tc.desc    Verify getOwner returns owning class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldGetOwner0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldGetOwner0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('remark');
                expect(field != undefined).assertTrue();
                expect(field!.getOwner().getName()).assertEqual(cls.getName());
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_GETNAME_0100
         * @tc.name    testReflectStaticFieldGetName0001
         * @tc.desc    Verify getName returns field name
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldGetName0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('remark');
                expect(field != undefined).assertTrue();
                expect(field!.getName()).assertEqual('remark');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_EQUALS_0100
         * @tc.name    testReflectStaticFieldEquals0001
         * @tc.desc    Verify equals for StaticField
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldEquals0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field1 = cls.getStaticField('remark');
                let field2 = cls.getStaticField('remark');
                expect(field1 != undefined && field2 != undefined).assertTrue();
                expect(field1!.equals(field2!)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_GETVALUE_0100
         * @tc.name    testReflectStaticFieldGetValue0001
         * @tc.desc    Verify getValue reads static field value
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldGetValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldGetValue0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('remark');
                expect(field != undefined).assertTrue();
                let value = field!.getValue();
                expect(value as string).assertEqual(FieldTestClass.remark);
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICFIELD_SETVALUE_0100
         * @tc.name    testReflectStaticFieldSetValue0001
         * @tc.desc    Verify setValue writes static field value
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticFieldSetValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticFieldSetValue0001';
            try {
                let cls = Class.from<FieldTestClass>();
                let field = cls.getStaticField('remark');
                expect(field != undefined).assertTrue();
                field!.setValue('new remark');
                expect(FieldTestClass.remark).assertEqual('new remark');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_ISNATIVE_0100
         * @tc.name    testReflectInstanceMethodIsNative0001
         * @tc.desc    Verify isNative for native method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodIsNative0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodIsNative0001';
            try {
                let cls = Class.from<Array<int>>();
                let method = cls.getInstanceMethod('$_set');
                expect(method !== undefined).assertTrue();
                expect(method!.isNative()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_ISPUBLIC_0100
         * @tc.name    testReflectInstanceMethodIsPublic0001
         * @tc.desc    Verify isPublic for public method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodIsPublic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodIsPublic0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('test', [Class.from<string>()])!;
                expect(method.isPublic()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_GETNAME_0100
         * @tc.name    testReflectInstanceMethodGetName0001
         * @tc.desc    Verify getName returns method name
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodGetName0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('test', [Class.from<string>()])!;
                expect(method!.getName()).assertEqual('test');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_GETOWNER_0100
         * @tc.name    testReflectInstanceMethodGetOwner0001
         * @tc.desc    Verify getOwner returns owning class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodGetOwner0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodGetOwner0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('test', [Class.from<string>()])!;
                expect(method!.getOwner().getName()).assertEqual(cls.getName());
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_GETRETURNTYPE_0100
         * @tc.name    testReflectInstanceMethodGetReturnType0001
         * @tc.desc    Verify getReturnType returns return type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodGetReturnType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodGetReturnType0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('test', [Class.from<string>()])!;
                let returnType = method.getReturnType();
                expect(returnType.getName()).assertEqual('std.core.String');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_GETPARAMETERTYPES_0100
         * @tc.name    testReflectInstanceMethodGetParameterTypes0001
         * @tc.desc    Verify getParameterTypes returns parameter types
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodGetParameterTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodGetParameterTypes0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('test', [Class.from<string>()])!;
                let paramTypes = method!.getParameterTypes();
                expect(paramTypes.length).assertEqual(1);
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_GETPARAMETERTYPE_0100
         * @tc.name    testReflectInstanceMethodGetParameterType0001
         * @tc.desc    Verify getParameterType returns correct type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodGetParameterType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodGetParameterType0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('test', [Class.from<string>()])!;
                let paramType = method.getParameterType(0);
                expect(paramType != undefined).assertTrue();
                expect(paramType!.getName()).assertEqual('std.core.String');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_GETPARAMETERSNUM_0100
         * @tc.name    testReflectInstanceMethodGetParametersNum0001
         * @tc.desc    Verify getParametersNum returns correct count
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodGetParametersNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodGetParametersNum0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('test', [Class.from<string>()])!;
                expect(method.getParametersNum()).assertEqual(1);
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_ISFINAL_0100
         * @tc.name    testReflectInstanceMethodIsFinal0001
         * @tc.desc    Verify isFinal for final method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodIsFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodIsFinal0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('finalMethod', []);
                expect(method != undefined).assertTrue();
                expect(method!.isFinal()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_ISASYNC_0100
         * @tc.name    testReflectInstanceMethodIsAsync0001
         * @tc.desc    Verify isAsync for async method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodIsAsync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodIsAsync0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('asyncMethod', []);
                expect(method != undefined).assertTrue();
                expect(method!.isAsync()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_ISABSTRACT_0100
         * @tc.name    testReflectInstanceMethodIsAbstract0001
         * @tc.desc    Verify isAbstract for abstract method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodIsAbstract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodIsAbstract0001';
            try {
                let cls = Class.from<AbstractMethodClass>();
                let method = cls.getInstanceMethod('abstractMethod', []);
                expect(method != undefined).assertTrue();
                expect(method!.isAbstract()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_ISGETTER_0100
         * @tc.name    testReflectInstanceMethodIsGetter0001
         * @tc.desc    Verify isGetter for getter method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodIsGetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodIsGetter0001';
            try {
                let cls = Class.from<DerivedClass>();
                let method = cls.getInstanceMethod('%%get-name', []);
                expect(method != undefined).assertTrue();
                expect(method!.isGetter()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_ISSETTER_0100
         * @tc.name    testReflectInstanceMethodIsSetter0001
         * @tc.desc    Verify isSetter for setter method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodIsSetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodIsSetter0001';
            try {
                let cls = Class.from<DerivedClass>();
                let method = cls.getInstanceMethod('%%set-name', [Class.from<String>()]);
                expect(method != undefined).assertTrue();
                expect(method!.isSetter()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_EQUALS_0100
         * @tc.name    testReflectInstanceMethodEquals0001
         * @tc.desc    Verify equals for InstanceMethod
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodEquals0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method1 = cls.getInstanceMethod('test', [Class.from<string>()]);
                let method2 = cls.getInstanceMethod('test', [Class.from<string>()]);
                expect(method1 != undefined && method2 != undefined).assertTrue();
                expect(method1!.equals(method2!)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_INSTANCEMETHOD_INVOKE_0100
         * @tc.name    testReflectInstanceMethodInvoke0001
         * @tc.desc    Verify invoke calls instance method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectInstanceMethodInvoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectInstanceMethodInvoke0001';
            try {
                let obj = new MethodTestClass();
                let cls = Class.from<MethodTestClass>();
                let method = cls.getInstanceMethod('test', [Class.from<string>()]);
                expect(method != undefined).assertTrue();
                let val = method!.invoke(obj, ['new value']);
                expect(val as string).assertEqual('new value');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_ISNATIVE_0100
         * @tc.name    testReflectStaticMethodIsNative0001
         * @tc.desc    Verify isNative for native method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodIsNative0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodIsNative0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest')!;
                expect(method.isNative()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_ISPUBLIC_0100
         * @tc.name    testReflectStaticMethodIsPublic0001
         * @tc.desc    Verify isPublic for public method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodIsPublic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodIsPublic0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest', [Class.from<string>()])!;
                expect(method.isPublic()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_GETNAME_0100
         * @tc.name    testReflectStaticMethodGetName0001
         * @tc.desc    Verify getName returns method name
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodGetName0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest', [Class.from<string>()])!;
                expect(method!.getName()).assertEqual('staticTest');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_GETOWNER_0100
         * @tc.name    testReflectStaticMethodGetOwner0001
         * @tc.desc    Verify getOwner returns owning class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodGetOwner0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodGetOwner0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest', [Class.from<string>()])!;
                expect(method!.getOwner().getName()).assertEqual(cls.getName());
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_GETRETURNTYPE_0100
         * @tc.name    testReflectStaticMethodGetReturnType0001
         * @tc.desc    Verify getReturnType returns return type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodGetReturnType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodGetReturnType0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest', [Class.from<string>()])!;
                let returnType = method.getReturnType();
                expect(returnType.getName()).assertEqual('std.core.String');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_GETPARAMETERTYPES_0100
         * @tc.name    testReflectStaticMethodGetParameterTypes0001
         * @tc.desc    Verify getParameterTypes returns parameter types
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodGetParameterTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodGetParameterTypes0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest', [Class.from<string>()])!;
                let paramTypes = method!.getParameterTypes();
                expect(paramTypes.length).assertEqual(1);
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_GETPARAMETERTYPE_0100
         * @tc.name    testReflectStaticMethodGetParameterType0001
         * @tc.desc    Verify getParameterType returns correct type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodGetParameterType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodGetParameterType0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest', [Class.from<string>()])!;
                let paramType = method.getParameterType(0);
                expect(paramType != undefined).assertTrue();
                expect(paramType!.getName()).assertEqual('std.core.String');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_GETPARAMETERSNUM_0100
         * @tc.name    testReflectStaticMethodGetParametersNum0001
         * @tc.desc    Verify getParametersNum returns correct count
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodGetParametersNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodGetParametersNum0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest', [Class.from<string>()])!;
                expect(method.getParametersNum()).assertEqual(1);
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_ISASYNC_0100
         * @tc.name    testReflectStaticMethodIsAsync0001
         * @tc.desc    Verify isAsync for static async method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodIsAsync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodIsAsync0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticAsyncMethod', []);
                expect(method != undefined).assertTrue();
                expect(method!.isAsync()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_ISGETTER_0100
         * @tc.name    testReflectStaticMethodIsGetter0001
         * @tc.desc    Verify isGetter for static getter method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodIsGetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodIsGetter0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('%%get-name', []);
                expect(method != undefined).assertTrue();
                expect(method!.isGetter()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_ISSETTER_0100
         * @tc.name    testReflectStaticMethodIsSetter0001
         * @tc.desc    Verify isSetter for static setter method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodIsSetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodIsSetter0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('%%set-name', [Class.from<string>()]);
                expect(method != undefined).assertTrue();
                expect(method!.isSetter()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_EQUALS_0100
         * @tc.name    testReflectStaticMethodEquals0001
         * @tc.desc    Verify equals for StaticMethod
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodEquals0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method1 = cls.getStaticMethod('staticTest', [Class.from<string>()]);
                let method2 = cls.getStaticMethod('staticTest', [Class.from<string>()]);
                expect(method1 != undefined && method2 != undefined).assertTrue();
                expect(method1!.equals(method2!)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_STATICMETHOD_INVOKE_0100
         * @tc.name    testReflectStaticMethodInvoke0001
         * @tc.desc    Verify invoke calls static method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectStaticMethodInvoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectStaticMethodInvoke0001';
            try {
                let cls = Class.from<MethodTestClass>();
                let method = cls.getStaticMethod('staticTest', [Class.from<string>()]);
                expect(method != undefined).assertTrue();
                let result = method!.invoke(['test']);
                expect(result as string).assertEqual('test');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_ISNATIVE_0100
         * @tc.name    testReflectConstructorIsNative0001
         * @tc.desc    Verify isNative for native method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorIsNative0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorIsNative0001';
            try {
                let ctor = Class.from<TestCtor>().getConstructors()[0];
                expect(ctor.isNative()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_ISPUBLIC_0100
         * @tc.name    testReflectConstructorIsPublic0001
         * @tc.desc    Verify isPublic for public method
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorIsPublic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorIsPublic0001';
            try {
                let ctor = Class.from<TestCtor>().getConstructors()[0];
                expect(ctor.isPublic()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_GETNAME_0100
         * @tc.name    testReflectConstructorGetName0001
         * @tc.desc    Verify getName returns method name
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorGetName0001';
            try {
                let ctor = Class.from<TestCtor>().getConstructors()[0];
                expect(ctor.getName()).assertEqual('constructor');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_GETOWNER_0100
         * @tc.name    testReflectConstructorGetOwner0001
         * @tc.desc    Verify getOwner returns owning class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorGetOwner0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorGetOwner0001';
            try {
                let cls = Class.from<TestCtor>();
                let ctor = cls.getConstructors()[0];
                expect(ctor.getOwner().getName()).assertEqual(cls.getName());
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_GETRETURNTYPE_0100
         * @tc.name    testReflectConstructorGetReturnType0001
         * @tc.desc    Verify getReturnType returns return type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorGetReturnType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorGetReturnType0001';
            try {
                let ctor = Class.from<TestCtor>().getConstructors()[0];
                expect(ctor.getReturnType().getName()).assertEqual('void');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_GETPARAMETERTYPES_0100
         * @tc.name    testReflectConstructorGetParameterTypes0001
         * @tc.desc    Verify getParameterTypes returns parameter types
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorGetParameterTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorGetParameterTypes0001';
            try {
                let ctors = Class.from<TestCtor>().getConstructors();
                let count = 0;
                for (let i = 0; i < ctors.length; i++) {
                    count += ctors[i].getParameterTypes().length;
                }
                expect(count).assertEqual(1);
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_GETPARAMETERTYPE_0100
         * @tc.name    testReflectConstructorGetParameterType0001
         * @tc.desc    Verify getParameterType returns correct type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorGetParameterType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorGetParameterType0001';
            try {
                let ctors = Class.from<TestCtor>().getConstructors();
                for (let i = 0; i < ctors.length; i++) {
                    if (ctors[i].getParameterTypes().length > 0) {
                        let paramType = ctors[i].getParameterType(0);
                        expect(paramType != undefined).assertTrue();
                        expect(paramType!.getName()).assertEqual('std.core.String');
                    }
                }
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_GETPARAMETERSNUM_0100
         * @tc.name    testReflectConstructorGetParametersNum0001
         * @tc.desc    Verify getParametersNum returns correct count
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorGetParametersNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorGetParametersNum0001';
            try {
                let ctors = Class.from<TestCtor>().getConstructors();
                for (let i = 0; i < ctors.length; i++) {
                    expect(ctors[i].getParameterTypes().length).assertEqual(ctors[i].getParametersNum());
                }
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_EQUALS_0100
         * @tc.name    testReflectConstructorEquals0001
         * @tc.desc    Verify equals for Constructor
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorEquals0001';
            try {
                let ctor1 = Class.from<TestCtor>().getConstructors()[0];
                let ctor2 = Class.of(new TestCtor()).getConstructors()[0];
                expect(ctor1.equals(ctor2)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_CONSTRUCTOR_CREATEINSTANCE_0100
         * @tc.name    testReflectConstructorCreateInstance0001
         * @tc.desc    Verify createInstance with no args
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectConstructorCreateInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectConstructorCreateInstance0001';
            try {
                let cls = Class.from<TestCtor>();
                let ctors = cls.getConstructors();
                let found = false;
                for (let i = 0; i < ctors.length; i++) {
                    if (ctors[i].getParametersNum() == 0) {
                        let obj = ctors[i].createInstance() as TestCtor;
                        expect(obj.name).assertEqual('default');
                        found = true;
                        break;
                    }
                }
                expect(found).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_PROXY_CREATE_0100
         * @tc.name    testReflectProxyCreate0001
         * @tc.desc    Verify Proxy.create creates proxy instance
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectProxyCreate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectProxyCreate0001';
            try {
                let linker = Class.from<ProxyInterface>().getLinker();
                let target = new ProxyTarget();
                let handler = new MyHandler(target);
                let interfaces: FixedArray<Class> = [Class.from<ProxyInterface>()];
                let proxyObj = reflect.Proxy.create(linker, interfaces, handler);
                expect(proxyObj != undefined).assertTrue();

                let obj = proxyObj as ProxyInterface;
                obj.name = 'test';
                obj.age = 10;
                expect(obj.name).assertEqual(target.name);
                expect(obj.age).assertEqual(target.age);

                let val = obj.test('tom');
                expect(val).assertEqual('hellow: tom');
                expect(target.msg).assertEqual('hellow: tom');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_PROXY_ISPROXYCLASS_0100
         * @tc.name    testReflectProxyIsProxyClass0001
         * @tc.desc    Verify isProxyClass returns true for proxy
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectProxyIsProxyClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectProxyIsProxyClass0001';
            try {
                let linker = Class.from<ProxyInterface>().getLinker();
                let target = new ProxyTarget();
                let handler = new MyHandler(target);
                let interfaces: FixedArray<Class> = [Class.from<ProxyInterface>()];
                let proxyObj = reflect.Proxy.create(linker, interfaces, handler);
                let proxyClass = Class.ofAny(proxyObj);
                expect(proxyClass != undefined).assertTrue();
                expect(reflect.Proxy.isProxyClass(proxyClass!)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_PROXY_ISPROXYCLASS_0200
         * @tc.name    testReflectProxyIsProxyClass0002
         * @tc.desc    Verify isProxyClass returns false for non-proxy
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectProxyIsProxyClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectProxyIsProxyClass0002';
            try {
                let cls = Class.from<ProxyInterface>();
                expect(reflect.Proxy.isProxyClass(cls)).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_REFLECT_PROXY_GETHANDLER_0100
         * @tc.name    testReflectProxyGetHandler0001
         * @tc.desc    Verify getHandler returns the handler
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testReflectProxyGetHandler0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testReflectProxyGetHandler0001';
            try {
                let linker = Class.from<ProxyInterface>().getLinker();
                let target = new ProxyTarget();
                let handler = new MyHandler(target);
                let interfaces: FixedArray<Class> = [Class.from<ProxyInterface>()];
                let proxyObj = reflect.Proxy.create(linker, interfaces, handler);
                expect(proxyObj.getHandler() === handler).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });
    })
}
