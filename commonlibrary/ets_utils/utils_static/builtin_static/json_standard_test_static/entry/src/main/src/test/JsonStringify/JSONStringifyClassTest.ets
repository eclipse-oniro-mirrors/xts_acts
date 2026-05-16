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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../../hypium/index";
import Utils from '../Util.test';
class Test001EmptyClass {}

class Test002MyClass {
  name: string = "test";
}

class Test003MyClass {
  value: number;
  constructor(value: number) {
    this.value = value;
  }
}

class Test004MyClass {
  a: number = 1;
  b: string = "test";
  c: boolean = true;
}

class Test005ParentClass {
  parentProp: string = "parent";
}

class Test005ChildClass extends Test005ParentClass {
  childProp: string = "child";
}

class Test006GrandParent {
  grandProp: string = "grand";
}

class Test006Parent extends Test006GrandParent {
  parentProp: string = "parent";
}

class Test006Child extends Test006Parent {
  childProp: string = "child";
}

class Test007ParentClass {
  prop: string = "parent";
}

class Test007ChildClass extends Test007ParentClass {
  prop: string = "child";
}

class Test008ParentClass {
  publicProp: string = "public";
}

class Test008ChildClass extends Test008ParentClass {}

class Test009ParentClass {
  private privateProp: string = "private";
}

class Test009ChildClass extends Test009ParentClass {}

class Test010ParentClass {
  protected protectedProp: string = "protected";
}

class Test010ChildClass extends Test010ParentClass {}

interface Test011MyInterface {
  interfaceProp: string;
}

class Test011ParentClass {
  parentProp: string = "parent";
}

class Test011ChildClass extends Test011ParentClass implements Test011MyInterface {
  interfaceProp: string = "interface";
}

interface Test012MyInterface {
  interfaceProp: string;
}

class Test012ParentClass implements Test012MyInterface {
  interfaceProp: string = "interface";
}

class Test012ChildClass extends Test012ParentClass {
  childProp: string = "child";
}

interface Test013MyInterface {
  prop: string;
}

class Test013MyClass implements Test013MyInterface {
  prop: string = "value";
}

interface Test014MyInterface {
  required: string;
  optional?: number;
}

class Test014MyClass implements Test014MyInterface {
  required: string = "value";
  optional?: number = 42;
}

interface Test015MyInterface {
  readonly readonlyProp: string;
}

class Test015MyClass implements Test015MyInterface {
  readonlyProp: string = "value";
}

interface Test016Interface1 {
  prop1: string;
}

interface Test016Interface2 {
  prop2: number;
}

class Test016MyClass implements Test016Interface1, Test016Interface2 {
  prop1: string = "value1";
  prop2: number = 42;
}

interface Test017Interface1 {
  prop: string;
}

interface Test017Interface2 {
  prop: string;
}

class Test017MyClass implements Test017Interface1, Test017Interface2 {
  prop: string = "value";
}

class Test018MyClass {
  instanceMethod(): string {
    return "result";
  }
}

class Test019MyClass {
  prop: string = "value";
  method(): string {
    return "result";
  }
}

class Test020MyClass {
  static staticMethod(): string {
    return "result";
  }
}

class Test021MyClass {
  private _value: string = "value";
  get value(): string {
    return this._value;
  }
}

class Test022MyClass {
  private _value: string = "value";
  set value(val: string) {
    this._value = val;
  }
}

class Test023MyClass {
  private _value: string = "value";
  get value(): string {
    return this._value;
  }
  set value(val: string) {
    this._value = val;
  }
}

class Test024MyClass {
  publicProp: string = "public";
}

class Test025MyClass {
  publicMethod(): string {
    return "method";
  }
}

class Test026MyClass {
  a: number = 1;
  b: string = "test";
}

class Test027MyClass {
  private privateProp: string = "private";
}

class Test028MyClass {
  private privateMethod(): string {
    return "private";
  }
}

class Test029MyClass {
  publicProp: string = "public";
  private privateProp: string = "private";
}

class Test030MyClass {
  protected protectedProp: string = "protected";
}

class Test031MyClass {
  protected protectedMethod(): string {
    return "protected";
  }
}

class Test032MyClass {
  publicProp: string = "public";
  protected protectedProp: string = "protected";
}

class Test033MyClass {
  readonly readonlyProp: string = "readonly";
}

class Test034MyClass {
  readonly prop: string = "value";
}

class Test035MyClass {
  private readonly prop: string = "value";
}

class Test036MyClass {
  static staticProp: string = "static";
}

class Test037MyClass {
  static staticMethod(): string {
    return "static";
  }
}

class Test038MyClass {
  static staticProp: string = "static";
  instanceProp: string = "instance";
}

abstract class Test039AbstractClass {
  abstractProp: string = "abstract";
}

class Test039ConcreteClass extends Test039AbstractClass {
  concreteProp: string = "concrete";
}

class Test040GenericClass<T> {
  value: T;
  constructor(value: T) {
    this.value = value;
  }
}

class Test041GenericClass<T> {
  value: T;
  constructor(value: T) {
    this.value = value;
  }
}

class Test042GenericClass<T> {
  value: T;
  constructor(value: T) {
    this.value = value;
  }
}

class Test043MyClass implements JsonSerializable{
  prop: string = "value";
  toJSON(): string {
    return "custom";
  }
}

class Test044ParentClass implements JsonSerializable {
  toJSON(): string {
    return "parent";
  }
}

class Test044ChildClass extends Test044ParentClass {}

class Test045ParentClass implements JsonSerializable {
  toJSON(): string {
    return "parent";
  }
}

class Test045ChildClass extends Test045ParentClass {
  toJSON(): string {
    return "child";
  }
}

class Test046MyClass {
  prop?: string;
}

class Test047MyClass {
  date: Date = new Date(2006, 0, 2);
}

class Test048InnerClass {
  innerProp: string = "inner";
}

class Test048OuterClass {
  outerProp: string = "outer";
  inner: Test048InnerClass = new Test048InnerClass();
}

class Test049ItemClass {
  value: number = 0;
}

class Test049ContainerClass {
  items: Test049ItemClass[] = [new Test049ItemClass(), new Test049ItemClass()];
}

class Test050ItemClass {
  value: number = 0;
}

class Test050ContainerClass {
  itemMap: Record<string, Test050ItemClass> = { "a": new Test050ItemClass(), "b": new Test050ItemClass() };
}

class Test051MyClass {}

class Test052MyClass {
  prop1: string = "value1";
  prop2: string = "value2";
}

class Test053MyClass {
  value: number = 42;
}

class Test054MyClass {
  prop1: string = "value1";
  prop2: string = "value2";
  prop3: string = "value3";
}

class Test055MyClass {
  prop: string = "value";
}

class Test056InnerClass {
  innerProp: string = "inner";
}

class Test056OuterClass {
  outerProp: string = "outer";
  inner: Test056InnerClass = new Test056InnerClass();
}

export default function JSONStringifyClassBasicTest() {
  describe('JSONStringifyClassBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach( async () => {
      await Utils.msSleep(20);
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
      const obj = new Test001EmptyClass();
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
      const obj = new Test002MyClass();
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
      const obj = new Test003MyClass(42);
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
      const obj = new Test004MyClass();
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
      const obj = new Test005ChildClass();
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
      const obj = new Test006Child();
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
      const obj = new Test007ChildClass();
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
      const obj = new Test008ChildClass();
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
      const obj = new Test009ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
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
      const obj = new Test010ChildClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
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
      const obj = new Test011ChildClass();
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
      const obj = new Test012ChildClass();
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
      const obj = new Test013MyClass();
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
      const obj = new Test014MyClass();
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
      const obj = new Test015MyClass();
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
      const obj = new Test016MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"prop1":"value1", "prop2":42}');
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
      const obj = new Test017MyClass();
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
      const obj = new Test018MyClass();
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
      const obj = new Test019MyClass();
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
      const obj = new Test020MyClass();
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
      const obj = new Test021MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
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
      const obj = new Test022MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
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
      const obj = new Test023MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
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
      const obj = new Test024MyClass();
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
      const obj = new Test025MyClass();
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
      const obj = new Test026MyClass();
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
      const obj = new Test027MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
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
      const obj = new Test028MyClass();
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
      const obj = new Test029MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"publicProp":"public"}');
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
      const obj = new Test030MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
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
      const obj = new Test031MyClass();
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
      const obj = new Test032MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"publicProp":"public"}');
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
      const obj = new Test033MyClass();
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
      const obj = new Test034MyClass();
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
      const obj = new Test035MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{}');
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
      const obj = new Test036MyClass();
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
      const obj = new Test037MyClass();
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
      const obj = new Test038MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"instanceProp":"instance"}');
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
      const obj = new Test039ConcreteClass();
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
      const obj = new Test040GenericClass<string>("test");
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
      const obj = new Test041GenericClass<number>(42);
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
      const obj = new Test042GenericClass<Record<string, number>>({ "a": 1 });
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
      const obj = new Test043MyClass();
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
      const obj = new Test044ChildClass();
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
      const obj = new Test045ChildClass();
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
      const obj = new Test046MyClass();
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
      const obj = new Test047MyClass();
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
      const obj = new Test048OuterClass();
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
      const obj = new Test049ContainerClass();
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
      const obj = new Test050ContainerClass();
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
      const obj = new Test051MyClass();
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
      const replacer = (key: string, value: Any): Any => {
        if (key === "prop2") {
          return undefined;
        }
        return value;
      };
      const obj = new Test052MyClass();
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
      const obj = new Test053MyClass();
      let result: string = JSON.stringify(obj);
      expect(result).assertEqual('{"value":42}');
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
      const obj = new Test054MyClass();
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
      const obj = new Test055MyClass();
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
      const obj = new Test056OuterClass();
      let result: string = JSON.stringify(obj, null, 2);
      expect(result).assertEqual('{\n  "outerProp": "outer",\n  "inner": {\n    "innerProp": "inner"\n  }\n}');
    });

  });
}
