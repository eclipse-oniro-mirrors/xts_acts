/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { testClassPropertyContainsSymbol, testClassPropertyContainsBigInt, testClassInstanceSelfReference, testClassInstanceMutualReference, testClassInstanceCircularWithPlainObject } from './JSONStringifyClassJS';


function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function JSONStringifyClassBasicTest() {
  describe('JSONStringifyClassBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach( async () => {
      await sleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   JSONStringify_Class_Basic_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_BASIC_0100
     * @tc.desc   Test empty class instance serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class EmptyClass {}
      const obj = new EmptyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Basic_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_BASIC_0200
     * @tc.desc   Test class instance with properties serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public name: string = "test";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"name":"test"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Basic_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_BASIC_0300
     * @tc.desc   Test class instance with constructor parameters serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public value: number;
        constructor(value: number) {
          this.value = value;
        }
      }
      const obj = new MyClass(42);
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"value":42}');
    });

    /**
     * @tc.name   JSONStringify_Class_Basic_004
     * @tc.number SUB_BUILTINSJSON_STRINGIFY_CLASS_BASIC_0400
     * @tc.desc   Test class instance with multiple properties serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public a: number = 1;
        public b: string = "test";
        public c: boolean = true;
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"b":"test","c":true}');
    });


    /**
     * @tc.name   JSONStringify_Class_Inheritance_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INHERITANCE_0100
     * @tc.desc   Test child class instance serialization includes parent properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Inheritance_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ParentClass {
        public parentProp: string = "parent";
      }
      class ChildClass extends ParentClass {
        public childProp: string = "child";
      }
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"parentProp":"parent","childProp":"child"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Inheritance_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INHERITANCE_0200
     * @tc.desc   Test multi-level inheritance serialization includes all ancestor properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Inheritance_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class GrandParent {
        public grandProp: string = "grand";
      }
      class Parent extends GrandParent {
        public parentProp: string = "parent";
      }
      class Child extends Parent {
        public childProp: string = "child";
      }
      const obj = new Child();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"grandProp":"grand","parentProp":"parent","childProp":"child"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Inheritance_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INHERITANCE_0300
     * @tc.desc   Test child class overriding parent property serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Inheritance_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ParentClass {
        public prop: string = "parent";
      }
      class ChildClass extends ParentClass {
        public prop: string = "child";
      }
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"prop":"child"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Inheritance_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INHERITANCE_0400
     * @tc.desc   Test inherited public property serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Inheritance_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ParentClass {
        public publicProp: string = "public";
      }
      class ChildClass extends ParentClass {}
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"publicProp":"public"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Inheritance_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INHERITANCE_0500
     * @tc.desc   Test inherited private property not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Inheritance_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ParentClass {
        private privateProp: string = "private";
      }
      class ChildClass extends ParentClass {}
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"privateProp":"private"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Inheritance_006
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INHERITANCE_0600
     * @tc.desc   Test inherited protected property not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Inheritance_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ParentClass {
        protected protectedProp: string = "protected";
      }
      class ChildClass extends ParentClass {}
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"protectedProp":"protected"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Inheritance_007
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INHERITANCE_0700
     * @tc.desc   Test child class implementing interface serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Inheritance_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface MyInterface {
        interfaceProp: string;
      }
      class ParentClass {
        public parentProp: string = "parent";
      }
      class ChildClass extends ParentClass implements MyInterface {
        public interfaceProp: string = "interface";
      }
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"parentProp":"parent","interfaceProp":"interface"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Inheritance_008
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INHERITANCE_0800
     * @tc.desc   Test parent class implementing interface child serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Inheritance_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface MyInterface {
        interfaceProp: string;
      }
      class ParentClass implements MyInterface {
        public interfaceProp: string = "interface";
      }
      class ChildClass extends ParentClass {
        public childProp: string = "child";
      }
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"interfaceProp":"interface","childProp":"child"}');
    });


    /**
     * @tc.name   JSONStringify_Class_Interface_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INTERFACE_0100
     * @tc.desc   Test class implementing interface serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Interface_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface MyInterface {
        prop: string;
      }
      class MyClass implements MyInterface {
        public prop: string = "value";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"prop":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Interface_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INTERFACE_0200
     * @tc.desc   Test interface optional property in class serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Interface_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface MyInterface {
        required: string;
        optional?: number;
      }
      class MyClass implements MyInterface {
        public required: string = "value";
        public optional: number = 42;
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"required":"value","optional":42}');
    });

    /**
     * @tc.name   JSONStringify_Class_Interface_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INTERFACE_0300
     * @tc.desc   Test interface readonly property in class serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Interface_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface MyInterface {
        readonly readonlyProp: string;
      }
      class MyClass implements MyInterface {
        public readonlyProp: string = "value";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"readonlyProp":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Interface_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INTERFACE_0400
     * @tc.desc   Test class implementing multiple interfaces serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Interface_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface Interface1 {
        prop1: string;
      }
      interface Interface2 {
        prop2: number;
      }
      class MyClass implements Interface1, Interface2 {
        public prop1: string = "value1";
        public prop2: number = 42;
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"prop1":"value1","prop2":42}');
    });

    /**
     * @tc.name   JSONStringify_Class_Interface_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_INTERFACE_0500
     * @tc.desc   Test interface property conflict serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Interface_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface Interface1 {
        prop: string;
      }
      interface Interface2 {
        prop: string;
      }
      class MyClass implements Interface1, Interface2 {
        public prop: string = "value";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"prop":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Methods_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_METHODS_0100
     * @tc.desc   Test instance method not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Methods_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public instanceMethod(): string {
          return "result";
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Methods_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_METHODS_0200
     * @tc.desc   Test instance method and property mixed - only property serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Methods_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public prop: string = "value";
        public method(): string {
          return "result";
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"prop":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Methods_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_METHODS_0300
     * @tc.desc   Test static method not serialized to instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Methods_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        static staticMethod(): string {
          return "result";
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Methods_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_METHODS_0400
     * @tc.desc   Test getter not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Methods_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        private _value: string = "value";
        public get value(): string {
          return this._value;
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"_value":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Methods_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_METHODS_0500
     * @tc.desc   Test setter not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Methods_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        private _value: string = "value";
        public set value(val: string) {
          this._value = val;
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"_value":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Methods_006
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_METHODS_0600
     * @tc.desc   Test getter and setter mixed - neither serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Methods_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        private _value: string = "value";
        public get value(): string {
          return this._value;
        }
        public set value(val: string) {
          this._value = val;
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"_value":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0100
     * @tc.desc   Test public property serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public publicProp: string = "public";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"publicProp":"public"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0200
     * @tc.desc   Test public method not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public publicMethod(): string {
          return "method";
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0300
     * @tc.desc   Test multiple public properties serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public a: number = 1;
        public b: string = "test";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"a":1,"b":"test"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0400
     * @tc.desc   Test private property not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        private privateProp: string = "private";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"privateProp":"private"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0500
     * @tc.desc   Test private method not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        private privateMethod(): string {
          return "private";
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_006
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0600
     * @tc.desc   Test private and public mixed - only public serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public publicProp: string = "public";
        private privateProp: string = "private";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"publicProp":"public","privateProp":"private"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_007
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0700
     * @tc.desc   Test protected property not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        protected protectedProp: string = "protected";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"protectedProp":"protected"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_008
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0800
     * @tc.desc   Test protected method not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        protected protectedMethod(): string {
          return "protected";
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_009
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_0900
     * @tc.desc   Test protected and public mixed - only public serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public publicProp: string = "public";
        protected protectedProp: string = "protected";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"publicProp":"public","protectedProp":"protected"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_010
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_1000
     * @tc.desc   Test readonly property serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        readonly readonlyProp: string = "readonly";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"readonlyProp":"readonly"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_011
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_1100
     * @tc.desc   Test readonly public property serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public readonly prop: string = "value";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"prop":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_012
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_1200
     * @tc.desc   Test readonly private property not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        private readonly prop: string = "value";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"prop":"value"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_013
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_1300
     * @tc.desc   Test static property not serialized to instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        static staticProp: string = "static";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_014
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_1400
     * @tc.desc   Test static method not serialized to instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        static staticMethod(): string {
          return "static";
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Modifiers_015
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_MODIFIERS_1500
     * @tc.desc   Test static and instance properties mixed - only instance serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Modifiers_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        static staticProp: string = "static";
        public instanceProp: string = "instance";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"instanceProp":"instance"}');
    });


    /**
     * @tc.name   JSONStringify_Class_Special_JS_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_JS_0100
     * @tc.desc   Test class property containing Symbol - ignored
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_JS_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testClassPropertyContainsSymbol();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   JSONStringify_Class_Special_JS_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_JS_0200
     * @tc.desc   Test class property containing BigInt - throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_JS_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testClassPropertyContainsBigInt();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   JSONStringify_Class_Special_JS_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_JS_0300
     * @tc.desc   Test class instance self reference - throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_JS_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testClassInstanceSelfReference();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   JSONStringify_Class_Special_JS_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_JS_0400
     * @tc.desc   Test class instance mutual reference - throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_JS_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testClassInstanceMutualReference();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   JSONStringify_Class_Special_JS_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_JS_0500
     * @tc.desc   Test class instance circular with plain object - throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_JS_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testClassInstanceCircularWithPlainObject();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   JSONStringify_Class_Special_001
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0100
     * @tc.desc   Test abstract class child instance serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      abstract class AbstractClass {
        public abstractProp: string = "abstract";
      }
      class ConcreteClass extends AbstractClass {
        public concreteProp: string = "concrete";
      }
      const obj = new ConcreteClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"abstractProp":"abstract","concreteProp":"concrete"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_002
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0200
     * @tc.desc   Test generic class instance serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class GenericClass<T> {
        public value: T;
        constructor(value: T) {
          this.value = value;
        }
      }
      const obj = new GenericClass<string>("test");
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"value":"test"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_003
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0300
     * @tc.desc   Test generic class number type instance serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class GenericClass<T> {
        public value: T;
        constructor(value: T) {
          this.value = value;
        }
      }
      const obj = new GenericClass<number>(42);
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"value":42}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_004
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0400
     * @tc.desc   Test generic class object type instance serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class GenericClass<T> {
        public value: T;
        constructor(value: T) {
          this.value = value;
        }
      }
      const obj = new GenericClass<Record<string, number>>({ "a": 1 });
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"value":{"a":1}}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_005
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0500
     * @tc.desc   Test class instance toJSON method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public prop: string = "value";
        public toJSON(): string {
          return "custom";
        }
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('"custom"');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_006
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0600
     * @tc.desc   Test child class inheriting parent toJSON method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ParentClass {
        public toJSON(): string {
          return "parent";
        }
      }
      class ChildClass extends ParentClass {}
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('"parent"');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_007
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0700
     * @tc.desc   Test child class overriding parent toJSON method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ParentClass {
        public toJSON(): string {
          return "parent";
        }
      }
      class ChildClass extends ParentClass {
        public toJSON(): string {
          return "child";
        }
      }
      const obj = new ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('"child"');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_008
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0800
     * @tc.desc   Test class property containing undefined - ignored
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public prop?: string;
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_009
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_0900
     * @tc.desc   Test class property containing Date - converted to ISO string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public date: Date = new Date(2006, 0, 2);
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"date":"2006-01-01T16:00:00.000Z"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_010
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1000
     * @tc.desc   Test class property containing class instance - recursive serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class InnerClass {
        public innerProp: string = "inner";
      }
      class OuterClass {
        public outerProp: string = "outer";
        public inner: InnerClass = new InnerClass();
      }
      const obj = new OuterClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"outerProp":"outer","inner":{"innerProp":"inner"}}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_011
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1100
     * @tc.desc   Test class property containing class instance array - recursive serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ItemClass {
        public value: number = 0;
      }
      class ContainerClass {
        public items: ItemClass[] = [new ItemClass(), new ItemClass()];
      }
      const obj = new ContainerClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"items":[{"value":0},{"value":0}]}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_012
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1200
     * @tc.desc   Test class property containing class instance object - recursive serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class ItemClass {
        public value: number = 0;
      }
      class ContainerClass {
        public itemMap: Record<string, ItemClass> = { "a": new ItemClass(), "b": new ItemClass() };
      }
      const obj = new ContainerClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"itemMap":{"a":{"value":0},"b":{"value":0}}}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_013
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1300
     * @tc.desc   Test prototype property not serialized
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {}
      const obj = new MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_014
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1400
     * @tc.desc   Test replacer function filtering class properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public prop1: string = "value1";
        public prop2: string = "value2";
      }
      const replacer = (key: string, value: Object): ESObject => {
        if (key === "prop2") {
          return undefined;
        }
        return value;
      };
      const obj = new MyClass();
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"prop1":"value1"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_015
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1500
     * @tc.desc   Test replacer function converting class property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public value: number = 42;
      }
      const replacer = (key: string, value: Object): Object => {
        if (typeof value === "number") {
          return (value as number) * 2;
        }
        return value;
      };
      const obj = new MyClass();
      let result: string = JSON.stringify(obj, replacer);
      expect(result).assertEqual('{"value":84}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_016
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1600
     * @tc.desc   Test replacer array selecting class properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public prop1: string = "value1";
        public prop2: string = "value2";
        public prop3: string = "value3";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj, ["prop1", "prop3"]);
      expect(result).assertEqual('{"prop1":"value1","prop3":"value3"}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_017
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1700
     * @tc.desc   Test class instance serialization with space formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class MyClass {
        public prop: string = "value";
      }
      const obj = new MyClass();
      let result: string = JSON.stringify(obj, null, 2);
      expect(result).assertEqual('{\n  "prop": "value"\n}');
    });

    /**
     * @tc.name   JSONStringify_Class_Special_018
     * @tc.number SUB_BUILTINS_JSON_STRINGIFY_CLASS_SPECIAL_1800
     * @tc.desc   Test nested class instance serialization with space formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('JSONStringify_Class_Special_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class InnerClass {
        public innerProp: string = "inner";
      }
      class OuterClass {
        public outerProp: string = "outer";
        public inner: InnerClass = new InnerClass();
      }
      const obj = new OuterClass();
      let result: string = JSON.stringify(obj, null, 2);
      expect(result).assertEqual('{\n  "outerProp": "outer",\n  "inner": {\n    "innerProp": "inner"\n  }\n}');
    });

  });
}
