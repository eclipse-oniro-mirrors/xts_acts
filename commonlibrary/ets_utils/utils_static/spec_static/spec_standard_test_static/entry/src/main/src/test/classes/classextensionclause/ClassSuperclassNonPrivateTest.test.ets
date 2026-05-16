/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Parent {
  public greet(): string {
    return "Hello";
  }
}

class Child extends Parent {
  public callParentGreet(): string {
    return this.greet();
  }
}

class Parent1 {
  public greet(): string {
    return "Hello";
  }
}

class Child1 extends Parent1 {
  public greet(): string {
    return "Word";
  }

  public callParentGreet(): string {
    return super.greet();
  }
}

class Parent2 {
  public greet(): string {
    return "Hello";
  }

  public farewell(): string {
    return "Word";
  }
}

class Child2 extends Parent2 {
  public callParentMethods(): string {
    return `${this.greet()} ${this.farewell()}`;
  }
}

class Parent3 {
  private name: string;
  constructor(name: string) {
    this.name = name;
  }

  public greet(): string {
    return `Hello, my name is ${this.name}!`;
  }
}

class Child3 extends Parent3 {
  constructor(name: string) {
    super(name);
  }

  public callParentGreet(): string {
    return this.greet();
  }
}

class KeyValuePair {
  key: string = '';
  value: number = 0;
  constructor(key: string, value: number) {
    this.value = value;
    this.key = key;
  }
}

class Parent4 {
  public createObject(): KeyValuePair {
    return new KeyValuePair("example", 42);
  }
}

class Child4 extends Parent4 {
  public callParentCreateObject(): KeyValuePair {
    return this.createObject();
  }
}

class Parent5 {
  protected message: string = "Hello from Parent!";

  public greet(): string {
    return this.message;
  }
}

class Child5 extends Parent5 {
  protected message: string = "Hello from Child!";

  public callParentGreet(): string {
    return this.greet();
  }
}

class Parent6 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child6 extends Parent6 {
  public greet(): string {
    return "Hello from Child!";
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent7 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child7 extends Parent7 {
  public customGreet(): string {
    return "Custom Hello from Child!";
  }

  public greet(): string {
    return this.customGreet();
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent8 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child8 extends Parent8 {
  protected customMessage: string = "Custom Hello from Child!";

  public greet(): string {
    return this.customMessage;
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent9 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child9 extends Parent9 {
  protected customMessage: string = "Custom Hello from Child!";

  public customGreet(): string {
    return this.customMessage;
  }

  public greet(): string {
    return this.customGreet();
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent10 {
  public step1(): string {
    return "Step 1 from Parent";
  }

  public step2(): string {
    return this.step1() + " -> Step 2 from Parent";
  }
}

class Child10 extends Parent10 {
  public callParentChain(): string {
    return this.step2();
  }
}

class Parent11 {
  public step1(): string {
    return "Step 1 from Parent";
  }

  public step2(): string {
    return this.step1() + " -> Step 2 from Parent";
  }
}

class Child11 extends Parent11 {
  public step1(): string {
    return "Step 1 from Child";
  }

  public callParentChain(): string {
    return this.step2();
  }
}

class Parent12 {
  public step1(): string {
    return "Step 1 from Parent";
  }

  public step2(): string {
    return this.step1() + " -> Step 2 from Parent";
  }
}

class Child12 extends Parent12 {
  public customStep(): string {
    return "Custom Step from Child";
  }

  public step1(): string {
    return this.customStep();
  }

  public callParentChain(): string {
    return this.step2();
  }
}

class Parent13 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child13 extends Parent13 {
  protected customMessage: string = "Custom Hello from Child!";

  public greet(): string {
    return this.customMessage;
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent14 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child14 extends Parent14 {
  protected customMessage: string = "Custom Hello from Child!";

  public customGreet(): string {
    return this.customMessage;
  }

  public greet(): string {
    return this.customGreet();
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent15 {
  public static staticMethod(): string {
    return "Static Method from Parent";
  }

  public greet(): string {
    return Parent15.staticMethod();
  }
}

class Child15 extends Parent15 {
  public static staticMethod(): string {
    return "Static Method from Child";
  }

  public callParentGreet(): string {
    return this.greet();
  }
}

class Parent16 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child16 extends Parent16 {
  public static customStaticMethod(): string {
    return "Custom Static Method from Child";
  }

  public greet(): string {
    return Child16.customStaticMethod();
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent17 {
  protected message: string;

  constructor(message: string) {
    this.message = message;
  }

  public greet(): string {
    return this.message;
  }
}

class Child17 extends Parent17 {
  constructor(message: string) {
    super("Modified: " + message);
  }

  public callParentGreet(): string {
    return this.greet();
  }
}

class Parent18 {
  protected message: string;

  constructor(message: string) {
    this.message = message;
  }

  public greet(): string {
    return this.message;
  }
}

class Child18 extends Parent18 {
  private additionalMessage: string;

  constructor(message: string, additionalMessage: string) {
    super(message);
    this.additionalMessage = additionalMessage;
  }

  public callParentGreet(): string {
    return this.greet() + " " + this.additionalMessage;
  }
}

class Parent19 {
  private _message: string = "Hello from Parent!";

  get message(): string {
    return this._message;
  }

  public greet(): string {
    return this.message;
  }
}

class Child19 extends Parent19 {
  private _message: string = "Hello from Child!";

  get message(): string {
    return this._message;
  }

  public callParentGreet(): string {
    return this.greet();
  }
}

class Parent20 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child20 extends Parent20 {
  private _customMessage: string = "Custom Hello from Child!";

  get customMessage(): string {
    return this._customMessage;
  }

  public greet(): string {
    return this.customMessage;
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent21 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child21 extends Parent21 {
  private _customMessage: string = "";

  set customMessage(value: string) {
    this._customMessage = "Custom: " + value;
  }

  public greet(): string {
    return this._customMessage;
  }

  public callParentFarewell(): string {
    this.customMessage = "Hello from Child!";
    return this.farewell();
  }
}

class Parent22 {
  static staticMessage: string = "Static Message from Parent";
  public greet(): string {
    return Parent22.staticMessage;
  }
}

class Child22 extends Parent22 {
  static staticMessage: string = "Static Message from Child";
  public callParentGreet(): string {
    return this.greet();
  }
}

class Parent23 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child23 extends Parent23 {
  static customStaticMessage: string = "Custom Static Message from Child";

  public greet(): string {
    return Child23.customStaticMessage;
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent24 {
  protected message: string;
  constructor(message: string) {
    this.message = message;
  }

  public greet(): string {
    return this.message;
  }
}

class Child24 extends Parent24 {
  constructor(message: string) {
    super("Modified: " + message);
  }
  public callParentGreet(): string {
    return this.greet();
  }
}

class Parent25 {
  protected message: string;
  constructor(message: string) {
    this.message = message;
  }

  public greet(): string {
    return this.message;
  }
}

class Child25 extends Parent25 {
  private additionalMessage: string;
  constructor(message: string, additionalMessage: string) {
    super(message);
    this.additionalMessage = additionalMessage;
  }

  public callParentGreet(): string {
    return this.greet() + " " + this.additionalMessage;
  }
}

class Parent26 {
  public async fetchMessage(): Promise<string> {
    return "Hello from Parent!";
  }

  public async greet(): Promise<string> {
    return await this.fetchMessage();
  }
}

class Child26 extends Parent26 {
  public async fetchMessage(): Promise<string> {
    return "Hello from Child!";
  }

  public async callParentGreet(): Promise<string> {
    return await this.greet();
  }
}

class Parent27 {
  public async greet(): Promise<string> {
    return "Hello from Parent!";
  }

  public async farewell(): Promise<string> {
    return (await this.greet()) + " Goodbye from Parent!";
  }
}

class Child27 extends Parent27 {
  public async customFetchMessage(): Promise<string> {
    return "Custom Hello from Child!";
  }

  public async greet(): Promise<string> {
    return await this.customFetchMessage();
  }

  public async callParentFarewell(): Promise<string> {
    return await this.farewell();
  }
}

class Parent28 {
  private secret(): string {
    return "Secret from Parent!";
  }

  public reveal(): string {
    return this.secret();
  }
}

class Child28 extends Parent28 {
  private secret(): string {
    return "Secret from Child!";
  }

  public callParentReveal(): string {
    return this.reveal();
  }
}

class Parent29 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child29 extends Parent29 {
  private customSecret(): string {
    return "Custom Secret from Child!";
  }

  public greet(): string {
    return this.customSecret();
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class Parent30 {
  protected protectedMethod(): string {
    return "Protected Method from Parent!";
  }

  public greet(): string {
    return this.protectedMethod();
  }
}

class Child30 extends Parent30 {
  protected protectedMethod(): string {
    return "Protected Method from Child!";
  }

  public callParentGreet(): string {
    return this.greet();
  }
}

class Parent31 {
  public greet(): string {
    return "Hello from Parent!";
  }

  public farewell(): string {
    return this.greet() + " Goodbye from Parent!";
  }
}

class Child31 extends Parent31 {
  protected customProtectedMethod(): string {
    return "Custom Protected Method from Child!";
  }

  public greet(): string {
    return this.customProtectedMethod();
  }

  public callParentFarewell(): string {
    return this.farewell();
  }
}

class GrandParent {
  public greet(): string {
    return "Hello from GrandParent!";
  }
}

class Parent32 extends GrandParent {
  public greet(): string {
    return super.greet() + " And Hello from Parent!";
  }
}

class Child32 extends Parent32 {
  public callGrandParentGreet(): string {
    return this.greet();
  }
}




export default function ClassSuperclassNonPrivateTest() {
  describe('ClassSuperclassNonPrivateTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0100
     * @tc.name      testClassSuperclassNonPrivate0001
     * @tc.desc      A subclass directly calls a non-private method of its superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0001';
      console.log(TAG + ' start');

      const child = new Child();
      expect(child.callParentGreet()).assertEqual("Hello");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0200
     * @tc.name      testClassSuperclassNonPrivate0002
     * @tc.desc      After a subclass overrides a method of its superclass, it calls the superclass method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0002';
      console.log(TAG + ' start');

      const child = new Child1();
      expect(child.callParentGreet()).assertEqual("Hello");
      expect(child.greet()).assertEqual("Word");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0300
     * @tc.name      testClassSuperclassNonPrivate0003
     * @tc.desc      A subclass calls multiple non - private methods of its superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0003';
      console.log(TAG + ' start');

      const child = new Child2();
      expect(child.callParentMethods()).assertEqual("Hello Word");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0400
     * @tc.name      testClassSuperclassNonPrivate0004
     * @tc.desc      A subclass calls a method of its superclass, and the superclass method depends
     * on the superclass's properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0004';
      console.log(TAG + ' start');

      const child = new Child3("Alice");
      expect(child.callParentGreet()).assertEqual("Hello, my name is Alice!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0500
     * @tc.name      testClassSuperclassNonPrivate0005
     * @tc.desc      A subclass calls a method of its superclass, and the superclass method returns an object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0005';
      console.log(TAG + ' start');

      const child = new Child4();
      const result = child.callParentCreateObject();
      expect(result.key).assertEqual("example");
      expect(result.value).assertEqual(42);


    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0600
     * @tc.name      testClassSuperclassNonPrivate0006
     * @tc.desc      A subclass directly calls a non-private method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0006';
      console.log(TAG + ' start');

      const child = new Child5();
      expect(child.callParentGreet()).assertEqual("Hello from Child!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0700
     * @tc.name      testClassSuperclassNonPrivate0007
     * @tc.desc      The child class calls the method of the parent class, and the method overridden
     * by the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0007';
      console.log(TAG + ' start');

      const child = new Child6();
      expect(child.callParentFarewell()).assertEqual("Hello from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0800
     * @tc.name      testClassSuperclassNonPrivate0008
     * @tc.desc      The child class calls the method of the parent class, and the new method of
     * the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0008';
      console.log(TAG + ' start');

      const child = new Child7();
      expect(child.callParentFarewell()).assertEqual("Custom Hello from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_0900
     * @tc.name      testClassSuperclassNonPrivate0009
     * @tc.desc      The child class calls the method of the parent class, and the new properties
     * of the child class are used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0009';
      console.log(TAG + ' start');

      const child = new Child8();
      expect(child.callParentFarewell()).assertEqual("Custom Hello from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1000
     * @tc.name      testClassSuperclassNonPrivate0010
     * @tc.desc      The child class calls the method of the parent class, and the new methods and
     * properties of the child class are used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0010';
      console.log(TAG + ' start');

      const child = new Child9();
      expect(child.callParentFarewell()).assertEqual("Custom Hello from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1100
     * @tc.name      testClassSuperclassNonPrivate0011
     * @tc.desc      The child class calls the chained method of the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0011';
      console.log(TAG + ' start');

      const child = new Child10();
      expect(child.callParentChain()).assertEqual("Step 1 from Parent -> Step 2 from Parent");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1200
     * @tc.name      testClassSuperclassNonPrivate0012
     * @tc.desc       The child class calls the parent class method, and the chained method overridden
     * by the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0012';
      console.log(TAG + ' start');

      const child = new Child11();
      expect(child.callParentChain()).assertEqual("Step 1 from Child -> Step 2 from Parent");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1300
     * @tc.name      testClassSuperclassNonPrivate0013
     * @tc.desc      A subclass directly calls a non-private method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0013';
      console.log(TAG + ' start');

      const child = new Child12();
      expect(child.callParentChain()).assertEqual("Custom Step from Child -> Step 2 from Parent");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1400
     * @tc.name      testClassSuperclassNonPrivate0014
     * @tc.desc      The child class calls the parent class method, and the new properties of the
     * child class are used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0014';
      console.log(TAG + ' start');

      const child = new Child13();
      expect(child.callParentFarewell()).assertEqual("Custom Hello from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1500
     * @tc.name      testClassSuperclassNonPrivate0015
     * @tc.desc      The child class calls the parent class method, and the new methods and properties
     * of the child class are used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0015';
      console.log(TAG + ' start');

      const child = new Child14();
      expect(child.callParentFarewell()).assertEqual("Custom Hello from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1600
     * @tc.name      testClassSuperclassNonPrivate0016
     * @tc.desc      The child class calls the parent class method, and the parent class method uses
     * the static method overridden by the child class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0016';
      console.log(TAG + ' start');

      const child = new Child15();
      expect(child.callParentGreet()).assertEqual("Static Method from Parent");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1700
     * @tc.name      testClassSuperclassNonPrivate0017
     * @tc.desc      The child class calls the parent class method, and the new static method of
     * the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0017';
      console.log(TAG + ' start');

      const child = new Child16();
      expect(child.callParentFarewell()).assertEqual("Custom Static Method from Child Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1800
     * @tc.name      testClassSuperclassNonPrivate0018
     * @tc.desc      The child class calls the parent class method, and the constructor overridden
     * by the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0018';
      console.log(TAG + ' start');

      const child = new Child17("Hello from Child!");
      expect(child.callParentGreet()).assertEqual("Modified: Hello from Child!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_1900
     * @tc.name      testClassSuperclassNonPrivate0019
     * @tc.desc      The child class calls the parent class method, and the new constructor logic
     * of the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0019';
      console.log(TAG + ' start');

      const child = new Child18("Hello from Parent!", "And Hello from Child!");
      expect(child.callParentGreet()).assertEqual("Hello from Parent! And Hello from Child!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2000
     * @tc.name      testClassSuperclassNonPrivate0020
     * @tc.desc      The child class calls the parent class method, and the getter overridden by
     * the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0020';
      console.log(TAG + ' start');

      const child = new Child19();
      expect(child.callParentGreet()).assertEqual("Hello from Child!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2100
     * @tc.name      testClassSuperclassNonPrivate0021
     * @tc.desc      The child class calls the parent class method, and the new getter of the child
     * class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0021';
      console.log(TAG + ' start');

      const child = new Child20();
      expect(child.callParentFarewell()).assertEqual("Custom Hello from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2200
     * @tc.name      testClassSuperclassNonPrivate0022
     * @tc.desc      The child class calls the parent class method, and the new setter of the child
     * class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0022';
      console.log(TAG + ' start');

      const child = new Child21();
      expect(child.callParentFarewell()).assertEqual("Custom: Hello from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2300
     * @tc.name      testClassSuperclassNonPrivate0023
     * @tc.desc      The child class calls the parent class method, which uses the static properties
     * overridden by the child class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0023';
      console.log(TAG + ' start');

      const child = new Child22();
      expect(child.callParentGreet()).assertEqual("Static Message from Parent");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2400
     * @tc.name      testClassSuperclassNonPrivate0024
     * @tc.desc      The child class calls the parent class method, and the new static properties
     * of the child class are used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0024';
      console.log(TAG + ' start');

      const child = new Child23();
      expect(child.callParentFarewell()).assertEqual("Custom Static Message from Child Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2500
     * @tc.name      testClassSuperclassNonPrivate0025
     * @tc.desc      The child class calls the parent class method, which uses the constructor logic
     * overridden by the child class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0025';
      console.log(TAG + ' start');

      const child = new Child24("Hello from Child!");
      expect(child.callParentGreet()).assertEqual("Modified: Hello from Child!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2600
     * @tc.name      testClassSuperclassNonPrivate0026
     * @tc.desc      The child class calls the parent class method, and the new constructor logic
     * of the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0026';
      console.log(TAG + ' start');

      const child = new Child25("Hello from Parent!", "And Hello from Child!");
      expect(child.callParentGreet()).assertEqual("Hello from Parent! And Hello from Child!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2700
     * @tc.name      testClassSuperclassNonPrivate0027
     * @tc.desc      The child class calls the parent class method, and the asynchronous method overridden
     * by the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      const TAG = 'testClassSuperclassNonPrivate0027';
      console.log(TAG + ' start');

      const child = new Child26();
      expect(await child.callParentGreet()).assertEqual("Hello from Child!");
      done();

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2800
     * @tc.name      testClassSuperclassNonPrivate0028
     * @tc.desc      The child class calls the parent class method, and the new asynchronous method
     * of the child class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      const TAG = 'testClassSuperclassNonPrivate0028';
      console.log(TAG + ' start');

      const child = new Child27();
      expect(await child.callParentFarewell()).assertEqual("Custom Hello from Child! Goodbye from Parent!");
      done();

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_2900
     * @tc.name      testClassSuperclassNonPrivate0029
     * @tc.desc      The child class calls the parent class method, and the private method overridden by the child
     * class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0029';
      console.log(TAG + ' start');

      const child = new Child28();
      expect(child.callParentReveal()).assertEqual("Secret from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_3000
     * @tc.name      testClassSuperclassNonPrivate0030
     * @tc.desc      The child class calls the parent class method, and the new private method of the child class
     * is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0030';
      console.log(TAG + ' start');

      const child = new Child29();
      expect(child.callParentFarewell()).assertEqual("Custom Secret from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_3100
     * @tc.name      testClassSuperclassNonPrivate0031
     * @tc.desc      The child class calls the parent class method, and the protected method overridden by the child
     * class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0031';
      console.log(TAG + ' start');

      const child = new Child30();
      expect(child.callParentGreet()).assertEqual("Protected Method from Child!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_3200
     * @tc.name      testClassSuperclassNonPrivate0032
     * @tc.desc      The child class calls the parent class method, and the protected method newly added by the child
     * class is used in the parent class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0032';
      console.log(TAG + ' start');

      const child = new Child31();
      expect(child.callParentFarewell()).assertEqual("Custom Protected Method from Child! Goodbye from Parent!");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_NON_PRIVATETEST_3300
     * @tc.name      testClassSuperclassNonPrivate0033
     * @tc.desc      In multi-level inheritance, a subclass calls a method of its grandfather class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassNonPrivate0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassNonPrivate0033';
      console.log(TAG + ' start');

      const child = new Child32();
      expect(child.callGrandParentGreet()).assertEqual("Hello from GrandParent! And Hello from Parent!");

    });



  })
}