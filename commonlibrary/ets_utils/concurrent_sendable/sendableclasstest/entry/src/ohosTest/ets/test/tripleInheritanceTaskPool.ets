import { ArkTSUtils, collections, lang } from '@kit.ArkTS';

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}


@Sendable
export class topLevelSendableClass {
  num: number = 1;

  PrintNum() {
    console.info('Top level sendable class');
  }
}

export const topLevelInstance = new topLevelSendableClass();

@Sendable
export function TopLevelSendableFunction(): string {
  return 'Top level sendable function';
}

@Sendable
export type SendableFuncType = () => string;

export const enum SendableConstEnum {
  OPTION_1,
  OPTION_2,
  OPTION_3
}

export type ISendable = lang.ISendable;

export function identityFunction<T>(arg: T): T {
  return arg;
}

export function arrowFunc<T>(initializer: () => T): T {
  return initializer();
}

@Sendable
export function ModifiedTopLevelSendableFunction(): string {
  return 'Modified top level sendable function';
}

@Sendable
export class SendableFiveAttributeClass implements ISendable {
  myNumber: number = 0;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("defaultLock");

  constructor() {
  }

  // Set methods
  setMyNumber(value: number) {
    this.myNumber = value;
  }

  setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = value;
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  setMyArray(value: number[]) {
    this.myArray = new collections.Array<number>(...value);
  }

  setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  // Get methods
  getMyNumber(): number {
    return this.myNumber;
  }

  getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  // Async/Static methods
  async processMyNumber(value: number): Promise<number> {
    return Promise.resolve(value);
  }

  static processMyTopLevelClassInstance(value: topLevelSendableClass): topLevelSendableClass {
    return value;
  }

  async processMyEnum(value: SendableConstEnum): Promise<SendableConstEnum> {
    return Promise.resolve(value);
  }

  static processMyArray(value: collections.Array<number>): collections.Array<number> {
    return value;
  }

  async processMyAsyncLock(value: ArkTSUtils.locks.AsyncLock): Promise<ArkTSUtils.locks.AsyncLock> {
    return Promise.resolve(value);
  }
}

@Sendable
export class SendableFiveAttributeInheritClass extends SendableFiveAttributeClass {
  myString: string = '';

  constructor() {
    super();
  }

  setMyString(value: string) {
    this.myString = value;
  }

  getMyString(): string {
    return this.myString;
  }

  override setMyNumber(value: number) {
    super.setMyNumber(value + 10);
  }

  override getMyNumber(): number {
    return super.getMyNumber() * 2;
  }

  newMethod(): string {
    return `第一层继承方法`;
  }
}

@Sendable
export class SendableFiveAttributeInheritClassLevelTwo extends SendableFiveAttributeInheritClass {
  myBoolean: boolean = false;

  constructor() {
    super();
  }

  setMyBoolean(value: boolean) {
    this.myBoolean = value;
  }

  getMyBoolean(): boolean {
    return this.myBoolean;
  }

  override setMyString(value: string) {
    super.setMyString(value.toUpperCase());
  }

  override getMyString(): string {
    return `${super.getMyString()}!`;
  }

  anotherNewMethod(): string {
    return `第二层继承方法`;
  }
}

@Sendable
export class SendableFiveAttributeInheritClassLevelThree extends SendableFiveAttributeInheritClassLevelTwo {
  constructor() {
    super();
  }

  override setMyBoolean(value: boolean) {
    super.setMyBoolean(!value);
  }

  override getMyBoolean(): boolean {
    return !super.getMyBoolean();
  }

  finalNewMethod(): string {
    return `第三层继承方法`;
  }
}

@Sendable
export class SendableFourAttributeClass implements ISendable {
  myNumber: number = 42;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("defaultLock");
  myInheritedClass: InheritedSendableClass = new InheritedSendableClass();

  constructor() {
  }

  setMyNumber(value: number) {
    this.myNumber = value;
  }

  getMyNumber(): number {
    return this.myNumber;
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  setMyArray(values: number[]) {
    this.myArray = new collections.Array<number>(...values);
  }

  getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  setMyInheritedClass(value: InheritedSendableClass) {
    this.myInheritedClass = value;
  }

  getMyInheritedClass(): InheritedSendableClass {
    return this.myInheritedClass;
  }

  async performAsyncOperationWithNumber(value: number): Promise<number> {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(value);
      }, 1000);
    });
  }

  static processStaticEnum(value: SendableConstEnum): SendableConstEnum {
    return value;
  }
}

@Sendable
export class InheritedSendableClass implements ISendable {
  inheritedProperty: string = 'default';

  setInheritedProperty(value: string) {
    this.inheritedProperty = value;
  }

  getInheritedProperty(): string {
    return this.inheritedProperty;
  }
}

@Sendable
export class SecondLevelSendableClass extends SendableFourAttributeClass {
  additionalProperty: string = 'default';

  constructor() {
    super();
  }

  setAdditionalProperty(value: string) {
    this.additionalProperty = value;
  }

  getAdditionalProperty(): string {
    return this.additionalProperty;
  }

  setMyNumber(value: number) {
    super.setMyNumber(value + 10);
  }
}

@Sendable
export class ThirdLevelSendableClass extends SecondLevelSendableClass {
  thirdLevelProperty: boolean = true;

  constructor() {
    super();
  }

  setThirdLevelProperty(value: boolean) {
    this.thirdLevelProperty = value;
  }

  getThirdLevelProperty(): boolean {
    return this.thirdLevelProperty;
  }

  useInheritedProperties() {
    console.log(`Number: ${this.getMyNumber()}, String: ${this.getAdditionalProperty()}, Boolean: ${this.getThirdLevelProperty()}`);
  }
}

@Sendable
export class FourthLevelSendableClass extends ThirdLevelSendableClass {
  constructor() {
    super();
  }

  override setMyEnum() {
    super.setMyEnum(SendableConstEnum.OPTION_2);
  }
}

@Sendable
export class SendableFourAttributeClassOver implements ISendable {
  myNumber: number = 42;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("defaultLock");
  myInheritedClass: InheritedSendableClass = new InheritedSendableClass();
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  toString(): string {
    return `Person[name=${this.name}, age=${this.age}]`;
  }

  setMyNumber(value: number) {
    this.myNumber = value;
  }

  getMyNumber(): number {
    return this.myNumber;
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  setMyArray(values: number[]) {
    this.myArray = new collections.Array<number>(...values);
  }

  getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  setMyInheritedClass(value: InheritedSendableClass) {
    this.myInheritedClass = value;
  }

  getMyInheritedClass(): InheritedSendableClass {
    return this.myInheritedClass;
  }

  async performAsyncOperationWithNumber(value: number): Promise<number> {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(value);
      }, 1000);
    });
  }

  static processStaticEnum(value: SendableConstEnum): SendableConstEnum {
    return value;
  }
}

@Sendable
export class SecondLevelSendableClassOver extends SendableFourAttributeClassOver {
  additionalProperty: string = 'default';

  constructor(name: string, age: number) {
    super(name, age);
  }

  setAdditionalProperty(value: string) {
    this.additionalProperty = value;
  }

  getAdditionalProperty(): string {
    return this.additionalProperty;
  }

  setMyNumber(value: number) {
    super.setMyNumber(value + 10);
  }
}

@Sendable
export class ThirdLevelSendableClassOver extends SecondLevelSendableClassOver {
  thirdLevelProperty: boolean = true;

  constructor(name: string, age: number) {
    super(name, age);
  }

  setThirdLevelProperty(value: boolean) {
    this.thirdLevelProperty = value;
  }

  getThirdLevelProperty(): boolean {
    return this.thirdLevelProperty;
  }

  useInheritedProperties() {
    console.log(`Number: ${this.getMyNumber()}, String: ${this.getAdditionalProperty()}, Boolean: ${this.getThirdLevelProperty()}`);
  }
}

@Sendable
export class FourthLevelSendableClassOver extends ThirdLevelSendableClassOver {
  constructor(name: string, age: number) {
    super(name, age);
  }

  override setMyEnum() {
    super.setMyEnum(SendableConstEnum.OPTION_2);
  }
}