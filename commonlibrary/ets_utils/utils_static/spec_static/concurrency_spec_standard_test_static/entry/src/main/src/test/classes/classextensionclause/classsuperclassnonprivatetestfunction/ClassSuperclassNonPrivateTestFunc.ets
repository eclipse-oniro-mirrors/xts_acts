'use static'

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

export function testClassSuperclassNonPrivate0001() {
  const TAG = 'testClassSuperclassNonPrivate0001';

  const child = new Child();
  if (child.callParentGreet() !== "Hello") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Hello');
  }
}

export function testClassSuperclassNonPrivate0002() {
  const TAG = 'testClassSuperclassNonPrivate0002';

  const child = new Child1();
  if (child.callParentGreet() !== "Hello") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Hello');
  }

  if (child.greet() !== "Word") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Word');
  }
}

export function testClassSuperclassNonPrivate0003() {
  const TAG = 'testClassSuperclassNonPrivate0003';

  const child = new Child2();
  if (child.callParentMethods() !== "Hello Word") {
    console.info(`${TAG} Task execution failed: child.callParentMethods(): ${child.callParentMethods()}`);
    throw new Error('child.callParentMethods() check failed, expected Hello Word');
  }
}

export function testClassSuperclassNonPrivate0004() {
  const TAG = 'testClassSuperclassNonPrivate0004';

  const child = new Child3("Alice");
  if (child.callParentGreet() !== "Hello, my name is Alice!") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Hello, my name is Alice!');
  }
}

export function testClassSuperclassNonPrivate0005() {
  const TAG = 'testClassSuperclassNonPrivate0005';

  const child = new Child4();
  const result = child.callParentCreateObject();
  if (result.key !== "example") {
    console.info(`${TAG} Task execution failed: result.key: ${result.key}`);
    throw new Error('result.key check failed, expected example');
  }

  if (result.value !== 42) {
    console.info(`${TAG} Task execution failed: result.value: ${result.value}`);
    throw new Error('result.value check failed, expected 42');
  }
}

export function testClassSuperclassNonPrivate0007() {
  const TAG = 'testClassSuperclassNonPrivate0007';

  const child = new Child6();
  if (child.callParentFarewell() !== "Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0008() {
  const TAG = 'testClassSuperclassNonPrivate0008';

  const child = new Child7();
  if (child.callParentFarewell() !== "Custom Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0009() {
  const TAG = 'testClassSuperclassNonPrivate0009';

  const child = new Child8();
  if (child.callParentFarewell() !== "Custom Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0010() {
  const TAG = 'testClassSuperclassNonPrivate0010';

  const child = new Child9();
  if (child.callParentFarewell() !== "Custom Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0011() {
  const TAG = 'testClassSuperclassNonPrivate0011';

  const child = new Child10();
  if (child.callParentChain() !== "Step 1 from Parent -> Step 2 from Parent") {
    console.info(`${TAG} Task execution failed: child.callParentChain(): ${child.callParentChain()}`);
    throw new Error('child.callParentChain() check failed, expected Step 1 from Parent -> Step 2 from Parent');
  }
}

export function testClassSuperclassNonPrivate0012() {
  const TAG = 'testClassSuperclassNonPrivate0012';

  const child = new Child11();
  if (child.callParentChain() !== "Step 1 from Child -> Step 2 from Parent") {
    console.info(`${TAG} Task execution failed: child.callParentChain(): ${child.callParentChain()}`);
    throw new Error('child.callParentChain() check failed, expected Step 1 from Child -> Step 2 from Parent');
  }
}

export function testClassSuperclassNonPrivate0013() {
  const TAG = 'testClassSuperclassNonPrivate0013';

  const child = new Child12();
  if (child.callParentChain() !== "Custom Step from Child -> Step 2 from Parent") {
    console.info(`${TAG} Task execution failed: child.callParentChain(): ${child.callParentChain()}`);
    throw new Error('child.callParentChain() check failed, expected Custom Step from Child -> Step 2 from Parent');
  }
}

export function testClassSuperclassNonPrivate0014() {
  const TAG = 'testClassSuperclassNonPrivate0014';

  const child = new Child13();
  if (child.callParentFarewell() !== "Custom Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0015() {
  const TAG = 'testClassSuperclassNonPrivate0015';

  const child = new Child14();
  if (child.callParentFarewell() !== "Custom Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0016() {
  const TAG = 'testClassSuperclassNonPrivate0016';

  const child = new Child15();
  if (child.callParentGreet() !== "Static Method from Parent") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Static Method from Parent');
  }
}

export function testClassSuperclassNonPrivate0017() {
  const TAG = 'testClassSuperclassNonPrivate0017';

  const child = new Child16();
  if (child.callParentFarewell() !== "Custom Static Method from Child Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Static Method from Child Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0018() {
  const TAG = 'testClassSuperclassNonPrivate0018';

  const child = new Child17("Hello from Child!");
  if (child.callParentGreet() !== "Modified: Hello from Child!") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Modified: Hello from Child!');
  }
}

export function testClassSuperclassNonPrivate0019() {
  const TAG = 'testClassSuperclassNonPrivate0019';

  const child = new Child18("Hello from Parent!", "And Hello from Child!");
  if (child.callParentGreet() !== "Hello from Parent! And Hello from Child!") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Hello from Parent! And Hello from Child!');
  }
}

export function testClassSuperclassNonPrivate0020() {
  const TAG = 'testClassSuperclassNonPrivate0020';

  const child = new Child19();
  if (child.callParentGreet() !== "Hello from Child!") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Hello from Child!');
  }
}

export function testClassSuperclassNonPrivate0021() {
  const TAG = 'testClassSuperclassNonPrivate0021';

  const child = new Child20();
  if (child.callParentFarewell() !== "Custom Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0022() {
  const TAG = 'testClassSuperclassNonPrivate0022';

  const child = new Child21();
  if (child.callParentFarewell() !== "Custom: Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom: Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0023() {
  const TAG = 'testClassSuperclassNonPrivate0023';

  const child = new Child22();
  if (child.callParentGreet() !== "Static Message from Parent") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Static Message from Parent');
  }
}

export function testClassSuperclassNonPrivate0024() {
  const TAG = 'testClassSuperclassNonPrivate0024';

  const child = new Child23();
  if (child.callParentFarewell() !== "Custom Static Message from Child Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Static Message from Child Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0025() {
  const TAG = 'testClassSuperclassNonPrivate0025';

  const child = new Child24("Hello from Child!");
  if (child.callParentGreet() !== "Modified: Hello from Child!") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Modified: Hello from Child!');
  }
}

export function testClassSuperclassNonPrivate0026() {
  const TAG = 'testClassSuperclassNonPrivate0026';

  const child = new Child25("Hello from Parent!", "And Hello from Child!");
  if (child.callParentGreet() !== "Hello from Parent! And Hello from Child!") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Hello from Parent! And Hello from Child!');
  }
}

export async function testClassSuperclassNonPrivate0027() {
  const TAG = 'testClassSuperclassNonPrivate0027';

  const child = new Child26();
  const _actualValue = await child.callParentGreet();
  if (_actualValue !== "Hello from Child!") {
    console.info(`${TAG} Task execution failed: _actualValue: ${_actualValue}`);
    throw new Error('await child.callParentGreet() check failed, expected Hello from Child!');
  }
}

export async function testClassSuperclassNonPrivate0028() {
  const TAG = 'testClassSuperclassNonPrivate0028';

  const child = new Child27();
  const _actualValue = await child.callParentFarewell();
  if (_actualValue !== "Custom Hello from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: _actualValue: ${_actualValue}`);
    throw new Error('await child.callParentFarewell() check failed, expected Custom Hello from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0029() {
  const TAG = 'testClassSuperclassNonPrivate0029';

  const child = new Child28();
  if (child.callParentReveal() !== "Secret from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentReveal(): ${child.callParentReveal()}`);
    throw new Error('child.callParentReveal() check failed, expected Secret from Parent!');
  }
}

export function testClassSuperclassNonPrivate0030() {
  const TAG = 'testClassSuperclassNonPrivate0030';

  const child = new Child29();
  if (child.callParentFarewell() !== "Custom Secret from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Secret from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0031() {
  const TAG = 'testClassSuperclassNonPrivate0031';

  const child = new Child30();
  if (child.callParentGreet() !== "Protected Method from Child!") {
    console.info(`${TAG} Task execution failed: child.callParentGreet(): ${child.callParentGreet()}`);
    throw new Error('child.callParentGreet() check failed, expected Protected Method from Child!');
  }
}

export function testClassSuperclassNonPrivate0032() {
  const TAG = 'testClassSuperclassNonPrivate0032';

  const child = new Child31();
  if (child.callParentFarewell() !== "Custom Protected Method from Child! Goodbye from Parent!") {
    console.info(`${TAG} Task execution failed: child.callParentFarewell(): ${child.callParentFarewell()}`);
    throw new Error('child.callParentFarewell() check failed, expected Custom Protected Method from Child! Goodbye from Parent!');
  }
}

export function testClassSuperclassNonPrivate0033() {
  const TAG = 'testClassSuperclassNonPrivate0033';

  const child = new Child32();
  if (child.callGrandParentGreet() !== "Hello from GrandParent! And Hello from Parent!") {
    console.info(`${TAG} Task execution failed: child.callGrandParentGreet(): ${child.callGrandParentGreet()}`);
    throw new Error('child.callGrandParentGreet() check failed, expected Hello from GrandParent! And Hello from Parent!');
  }
}
