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

// Test classes for reflection
class MyClass {
    public name: string = 'test';
    public count: int = 0;
    public static staticCount: int = 0;

    public constructor() {
        this.name = 'default';
    }

    public constructor(name: string) {
        this.name = name;
    }

    public test(): string {
        return 'no param';
    }

    public test(msg: string): string {
        return msg;
    }

    public getName(): string {
        return this.name;
    }

    public setName(name: string): void {
        this.name = name;
    }

    public static staticTest(): string {
        return 'static';
    }

    public static staticTestWithParam(msg: string): string {
        return msg;
    }
}

class ParentClass {
    public parentField: string = 'parent';
}

class ChildClass extends ParentClass {
    public childField: string = 'child';
}

enum TestEnum {
    CLASS,
    METHOD
}

abstract class AbstractClass {
    public abstract abstractMethod(): void;
}

final class FinalClass {
    public value: string = 'final';
}

interface MyInterface {
    name: string;
    age: int;
    test(msg: string): string;
}

class InterfaceImpl implements MyInterface {
    public name: string = 'Bob';
    public age: int = 25;
    public arr: Array<string> = Array.create<string>(100, '');

    public $_get(index: int): string {
        return this.arr[index];
    }

    public $_set(index: int, val: string): void {
        this.arr[index] = val;
    }

    public get length(): int {
        return this.arr.length;
    }

    public test(msg: string): string {
        return msg;
    }

    public toJSON(): string {
        return this.arr.join();
    }
}

class MultiInterfaceImpl implements JsonSerializable, ArrayLike<string> {
    private arr: Array<string> = Array.create<string>(100, '');

    public constructor() {
    }

    public constructor(arr: Array<string>) {
        this.arr = arr;
    }

    public $_get(index: int): string {
        return this.arr[index];
    }

    public $_set(index: int, val: string): void {
        this.arr[index] = val;
    }

    public get length(): int {
        return this.arr.length;
    }

    public toJSON(): string {
        return this.arr.join();
    }
}

class TestCurrentClass {
    public getClass(): Class {
        return Class.current();
    }
}

class A {
    public test(): Class | undefined {
        return new B().testCaller()
    }
}
class B {
    public testCaller(): Class | undefined{
        return Class.ofCaller()
    }
}
class C {
    public test(): Class | undefined {
        return new B().testCaller()
    }
}

export default function classTest() {
    describe('ClassTest', (): void => {
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
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETNAME_0100
         * @tc.name    testClassGetName0001
         * @tc.desc    Verify getName returns correct class name
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetName0001';
            try {
                let clazz = Class.from<Map<int, int>>();
                expect(clazz.getName()).assertEqual('std.core.Map');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSUPER_0100
         * @tc.name    testClassGetSuper0001
         * @tc.desc    Verify getSuper returns parent class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetSuper0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetSuper0001';
            try {
                let clazz = Class.of(new MyClass());
                let superClazz = clazz.getSuper();
                expect(superClazz !== undefined).assertTrue();
                expect(superClazz!.getName()).assertEqual('std.core.Object');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSUPER_0200
         * @tc.name    testClassGetSuper0002
         * @tc.desc    Verify getSuper for child class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetSuper0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetSuper0002';
            try {
                let childClazz = Class.of(new ChildClass());
                let superClazz = childClazz.getSuper();
                expect(superClazz !== undefined).assertTrue();
                expect(superClazz!.getName()).assertEqual(Class.from<ParentClass>().getName());
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSUPER_0300
         * @tc.name    testClassGetSuper0003
         * @tc.desc    Verify getSuper for interface
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetSuper0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetSuper0003';
            try {
                let superClazz = Class.from<MyInterface>().getSuper();
                expect(superClazz === undefined).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISSUBTYPEOF_0100
         * @tc.name    testClassIsSubtypeOf0001
         * @tc.desc    Verify isSubtypeOf for inheritance
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsSubtypeOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsSubtypeOf0001';
            try {
                let childClazz = Class.from<ChildClass>();
                let parentClazz = Class.from<ParentClass>();
                expect(childClazz.isSubtypeOf(parentClazz)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISSUBTYPEOF_0200
         * @tc.name    testClassIsSubtypeOf0002
         * @tc.desc    Verify isSubtypeOf returns false for unrelated classes
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsSubtypeOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsSubtypeOf0002';
            try {
                let myClazz = Class.from<MyClass>();
                let childClazz = Class.from<ChildClass>();
                expect(myClazz.isSubtypeOf(childClazz)).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISSUBTYPEOF_0300
         * @tc.name    testClassIsSubtypeOf0003
         * @tc.desc    Verify isSubtypeOf returns true for union classes
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsSubtypeOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsSubtypeOf0003';
            try {
                let cls = Class.from<int | double | string>();
                expect(Class.from<double>().isSubtypeOf(cls)).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETLINKER_0100
         * @tc.name    testClassGetLinker0001
         * @tc.desc    Verify getLinker returns RuntimeLinker
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetLinker0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetLinker0001';
            try {
                let clazz = Class.from<MyClass>();
                let linker = clazz.getLinker();
                expect(linker != undefined).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETLINKER_0200
         * @tc.name    testClassGetLinker0002
         * @tc.desc    Verify linker can load classes
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetLinker0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetLinker0002';
            try {
                let clazz = Class.from<MyClass>();
                let linker = clazz.getLinker();
                let loadedClass = linker!.loadClass('std.core.Map');
                expect(loadedClass != undefined).assertTrue();
                expect(loadedClass!.getName()).assertEqual('std.core.Map');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0100
         * @tc.name    testClassGetFixedArrayComponentType0001
         * @tc.desc    Verify getFixedArrayComponentType
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetFixedArrayComponentType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetFixedArrayComponentType0001';
            try {
                let arr: FixedArray<int> = [1, 2, 3];
                let cls = Class.of(arr).getFixedArrayComponentType();
                expect(cls!.getName()).assertEqual('i32');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0200
         * @tc.name    testClassGetFixedArrayComponentType0002
         * @tc.desc    Verify getFixedArrayComponentType
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetFixedArrayComponentType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetFixedArrayComponentType0002';
            try {
                let arr = new Array<int>(1, 2, 3);
                let cls = Class.of(arr).getFixedArrayComponentType();
                expect(cls === undefined).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETINTERFACES_0100
         * @tc.name    testClassGetInterfaces0001
         * @tc.desc    Verify getInterfaces for class implementing single interface
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetInterfaces0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetInterfaces0001';
            try {
                let cls = Class.from<InterfaceImpl>();
                let interfaces = cls.getInterfaces();
                expect(interfaces.length >= 1).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETINTERFACES_0200
         * @tc.name    testClassGetInterfaces0002
         * @tc.desc    Verify getInterfaces for class implementing multiple interfaces
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetInterfaces0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetInterfaces0002';
            try {
                let cls = Class.from<MultiInterfaceImpl>();
                let arr = cls.getInterfaces();
                expect(arr.length >= 2).assertTrue();
                let foundJsonSerializable = false;
                let foundArrayLike = false;
                for (let i = 0; i < arr.length; i++) {
                    let name = arr[i].getName();
                    if (name === 'std.core.JsonSerializable') {
                        foundJsonSerializable = true;
                    }
                    if (name === 'std.core.ArrayLike') {
                        foundArrayLike = true;
                    }
                }
                expect(foundJsonSerializable && foundArrayLike).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_OFANY_0100
         * @tc.name    testClassOfAny0001
         * @tc.desc    Verify Class.ofAny returns correct class for object
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassOfAny0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassOfAny0001';
            try {
                let obj = new Map<int, string>();
                let cls = Class.ofAny(obj);
                expect(cls!.getName()).assertEqual('std.core.Map');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_OFANY_0200
         * @tc.name    testClassOfAny0002
         * @tc.desc    Verify Class.ofAny for undefined
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassOfAny0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassOfAny0002';
            try {
                let obj: Set<string> | undefined = undefined;
                let cls = Class.ofAny(obj);
                expect(cls === undefined).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_OF_0100
         * @tc.name    testClassOf0001
         * @tc.desc    Verify Class.of returns correct class for object
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassOf0001';
            try {
                let obj = new Map<int, string>();
                let cls = Class.of(obj);
                expect(cls.getName()).assertEqual('std.core.Map');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_OF_0200
         * @tc.name    testClassOf0002
         * @tc.desc    Verify Class.of for null
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassOf0002';
            try {
                let cls = Class.of(null);
                expect(cls.getName()).assertEqual('std.core.Null');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_FROM_0100
         * @tc.name    testClassFrom0001
         * @tc.desc    Verify Class.from for Map
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassFrom0001';
            try {
                let cls = Class.from<Map<int, string>>();
                expect(cls.getName()).assertEqual('std.core.Map');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_FROM_0200
         * @tc.name    testClassFrom0002
         * @tc.desc    Verify Class.from for Array
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassFrom0002';
            try {
                let cls = Class.from<Array<int>>();
                expect(cls.getName()).assertEqual('std.core.Array');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_CURRENT_0100
         * @tc.name    testClassCurrent0001
         * @tc.desc    Verify Class.current returns current class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassCurrent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassCurrent0001';
            try {
                let obj = new TestCurrentClass();
                let cls = obj.getClass();
                expect(cls.getName()).assertEqual(Class.from<TestCurrentClass>().getName());
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_OFCALLER_0100
         * @tc.name    testClassofCaller0001
         * @tc.desc    Verify createInstance creates new instance
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassofCaller0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassofCaller0001';
            try {
                expect(new A().test() === Class.from<A>()).assertTrue();
                expect(new C().test() === Class.from<C>()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_CREATEINSTANCE_0100
         * @tc.name    testClassCreateInstance0001
         * @tc.desc    Verify createInstance creates new instance
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassCreateInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassCreateInstance0001';
            try {
                let cls = Class.from<MyClass>();
                let obj = cls.createInstance() as MyClass;
                expect(obj.name).assertEqual('default');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETDESCRIPTOR_0100
         * @tc.name    testClassGetDescriptor0001
         * @tc.desc    Verify getDescriptor returns correct descriptor
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetDescriptor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetDescriptor0001';
            try {
                let cls = Class.from<Set<string>>();
                let descriptor = cls.getDescriptor();
                expect(descriptor).assertEqual('Lstd/core/Set;');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISENUM_0100
         * @tc.name    testClassIsEnum0001
         * @tc.desc    Verify isEnum returns true for enum
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsEnum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsEnum0001';
            try {
                let cls = Class.from<TestEnum>();
                expect(cls.isEnum()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISENUM_0200
         * @tc.name    testClassIsEnum0002
         * @tc.desc    Verify isEnum returns false for non-enum
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsEnum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsEnum0002';
            try {
                let cls = Class.from<Set<int>>();
                expect(cls.isEnum()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISINTERFACE_0100
         * @tc.name    testClassIsInterface0001
         * @tc.desc    Verify isInterface returns true for interface
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsInterface0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsInterface0001';
            try {
                let cls = Class.from<ArrayLike<int>>();
                expect(cls.isInterface()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISINTERFACE_0200
         * @tc.name    testClassIsInterface0002
         * @tc.desc    Verify isInterface returns false for class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsInterface0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsInterface0002';
            try {
                let cls = Class.from<Array<int>>();
                expect(cls.isInterface()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISFIXEDARRAY_0100
         * @tc.name    testClassIsFixedArray0001
         * @tc.desc    Verify isFixedArray returns true for FixedArray
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsFixedArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsFixedArray0001';
            try {
                let arr = new FixedArray<int>(1);
                let cls = Class.of(arr);
                expect(cls.isFixedArray()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISFIXEDARRAY_0200
         * @tc.name    testClassIsFixedArray0002
         * @tc.desc    Verify isFixedArray returns false for Array
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsFixedArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsFixedArray0002';
            try {
                let arr2 = new Array<int>();
                let cls2 = Class.of(arr2);
                expect(cls2.isFixedArray()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISUNION_0100
         * @tc.name    testClassIsUnion0001
         * @tc.desc    Verify isUnion returns true for union type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsUnion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsUnion0001';
            try {
                let cls = Class.from<int | string>();
                expect(cls.isUnion()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISUNION_0200
         * @tc.name    testClassIsUnion0002
         * @tc.desc    Verify isUnion returns false
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsUnion0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsUnion0002';
            try {
                let cls = Class.from<Array<int>>();
                expect(cls.isUnion()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISFINAL_0100
         * @tc.name    testClassIsFinal0001
         * @tc.desc    Verify isFinal returns true for final class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsFinal0001';
            try {
                let cls = Class.from<FinalClass>();
                expect(cls.isFinal()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISFINAL_0200
         * @tc.name    testClassIsFinal0002
         * @tc.desc    Verify isFinal returns false for Array
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsFinal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsFinal0002';
            try {
                let cls = Class.from<Array<string>>();
                expect(cls.isFinal()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISABSTRACT_0100
         * @tc.name    testClassIsAbstract0001
         * @tc.desc    Verify isAbstract returns true for abstract class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsAbstract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsAbstract0001';
            try {
                let cls = Class.from<AbstractClass>();
                expect(cls.isAbstract()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISABSTRACT_0200
         * @tc.name    testClassIsAbstract0002
         * @tc.desc    Verify isAbstract returns false for Array
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsAbstract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsAbstract0002';
            try {
                let cls = Class.from<Array<double>>();
                expect(cls.isAbstract()).assertFalse();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_ISPRIMITIVE_0100
         * @tc.name    testClassIsPrimitive0001
         * @tc.desc    Verify isPrimitive for byte type
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassIsPrimitive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassIsPrimitive0001';
            try {
                let cls = Class.from<byte>();
                expect(cls.isPrimitive()).assertFalse();
                expect(Class.PRIMITIVE_BYTE.isPrimitive()).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETINSTANCEMETHODS_0100
         * @tc.name    testClassGetInstanceMethods0001
         * @tc.desc    Verify getInstanceMethods returns public instance methods
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetInstanceMethods0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetInstanceMethods0001';
            try {
                let cls = Class.from<MyClass>();
                let methods = cls.getInstanceMethods();
                expect(methods.length > 0).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETINSTANCEMETHOD_0100
         * @tc.name    testClassGetInstanceMethod0001
         * @tc.desc    Verify getInstanceMethod with signature
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetInstanceMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetInstanceMethod0001';
            try {
                let obj = new MyClass();
                let cls = Class.from<MyClass>();
                let m = cls.getInstanceMethod('test', [Class.from<string>()]);
                expect(m !== undefined).assertTrue();
                let result = m!.invoke(obj, ['test']);
                expect(result as string).assertEqual('test');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETINSTANCEMETHOD_0200
         * @tc.name    testClassGetInstanceMethod0002
         * @tc.desc    Verify getInstanceMethod without signature
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetInstanceMethod0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetInstanceMethod0002';
            try {
                let obj = new MyClass();
                let cls = Class.from<MyClass>();
                let m = cls.getInstanceMethod('getName');
                expect(m !== undefined).assertTrue();
                let result = m!.invoke(obj);
                expect(result as string).assertEqual('default');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETINSTANCEMETHOD_0300
         * @tc.name    testClassGetInstanceMethod0003
         * @tc.desc    Verify getInstanceMethod
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetInstanceMethod0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetInstanceMethod0003';
            try {
                let cls = Class.from<MyClass>();
                let m = cls.getInstanceMethod('non-exist');
                expect(m === undefined).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSTATICMETHODS_0100
         * @tc.name    testClassGetStaticMethods0001
         * @tc.desc    Verify getStaticMethods returns static methods
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetStaticMethods0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetStaticMethods0001';
            try {
                let cls = Class.from<MyClass>();
                let methods = cls.getStaticMethods();
                expect(methods.length > 0).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSTATICMETHOD_0100
         * @tc.name    testClassGetStaticMethod0001
         * @tc.desc    Verify getStaticMethod with signature
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetStaticMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetStaticMethod0001';
            try {
                let cls = Class.from<MyClass>();
                let m = cls.getStaticMethod('staticTestWithParam', [Class.from<string>()]);
                expect(m != undefined).assertTrue();
                let result = m!.invoke(['test']);
                expect(result as string).assertEqual('test');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSTATICMETHOD_0200
         * @tc.name    testClassGetStaticMethod0002
         * @tc.desc    Verify getStaticMethod without signature
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetStaticMethod0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetStaticMethod0002';
            try {
                let cls = Class.from<MyClass>();
                let m = cls.getStaticMethod('staticTest', []);
                expect(m != undefined).assertTrue();
                let result = m!.invoke();
                expect(result as string).assertEqual('static');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSTATICMETHOD_0300
         * @tc.name    testClassGetStaticMethod0003
         * @tc.desc    Verify getStaticMethod without signature
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetStaticMethod0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetStaticMethod0003';
            try {
                let cls = Class.from<MyClass>();
                let m = cls.getStaticMethod('staticTest2', []);
                expect(m === undefined).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETINSTANCEFIELDS_0100
         * @tc.name    testClassGetInstanceFields0001
         * @tc.desc    Verify getInstanceFields returns public fields
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetInstanceFields0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetInstanceFields0001';
            try {
                let cls = Class.from<MyClass>();
                let fields = cls.getInstanceFields();
                expect(fields.length > 0).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETINSTANCEFIELD_0100
         * @tc.name    testClassGetInstanceField0001
         * @tc.desc    Verify getInstanceField returns correct field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetInstanceField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetInstanceField0001';
            try {
                let cls = Class.from<MyClass>();
                let field = cls.getInstanceField('name');
                expect(field != undefined).assertTrue();
                expect(field!.getName()).assertEqual('name');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSTATICFIELDS_0100
         * @tc.name    testClassGetStaticFields0001
         * @tc.desc    Verify getStaticFields returns static fields
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetStaticFields0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetStaticFields0001';
            try {
                let cls = Class.from<MyClass>();
                let fields = cls.getStaticFields();
                expect(fields.length > 0).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETSTATICFIELD_0100
         * @tc.name    testClassGetStaticField0001
         * @tc.desc    Verify getStaticField returns correct field
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetStaticField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetStaticField0001';
            try {
                let cls = Class.from<MyClass>();
                let field = cls.getStaticField('staticCount');
                expect(field != undefined).assertTrue();
                expect(field!.getName()).assertEqual('staticCount');
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETCONSTRUCTORS_0100
         * @tc.name    testClassGetConstructors0001
         * @tc.desc    Verify getConstructors returns constructors
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetConstructors0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetConstructors0001';
            try {
                let cls = Class.from<MyClass>();
                let ctors = cls.getConstructors();
                expect(ctors.length > 0).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CLASS_GETUNIONCONSTITUENTTYPES_0100
         * @tc.name    testClassGetUnionConstituentTypes0001
         * @tc.desc    Verify getUnionConstituentTypes returns class
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level 1
         */
        it('testClassGetUnionConstituentTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
            const TAG = 'testClassGetUnionConstituentTypes0001';
            try {
                let cls = Class.from<int | string>();
                let arr = cls.getUnionConstituentTypes();
                expect(arr != undefined).assertTrue();
                let intFlag = false;
                let stringFlag = false;
                for (let i = 0; i < arr!.length; i++) {
                    let name = arr![i].getName();
                    if (name === 'std.core.Int') {
                        intFlag = true;
                    }
                    if (name === 'std.core.String') {
                        stringFlag = true;
                    }
                }
                expect(intFlag && stringFlag).assertTrue();
            } catch (err) {
                console.error(`${TAG} failed: ${err.message}`);
                expect().assertFail();
            }
        });
    })
}
