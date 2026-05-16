/*
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
interface PersonInfo1{
  name:string;
  age:number;
}
class Person1 {
  private name: string;
  private age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  setName(name: string): void {
    this.name = name;
  }
  setAge(age: number): void {
    this.age = age;
  }
  updateInfo(info: Partial<PersonInfo1>): void {
    if (info.name !== undefined) {
      this.name = info.name!;
    }
    if (info.age !== undefined) {
      this.age = info.age!;
    }
  }
  getName(): string {
    return this.name;
  }
  getAge(): number {
    return this.age;
  }
}
interface UserInfo2{
  name:string;
  age:number;
}

interface UserInfo3 {
  name?: string;
  age?: number;
}
type RequiredUserInfo = Required<UserInfo3>;
class User3 {
  private id: number;
  public info: RequiredUserInfo;
  constructor(id: number, info: RequiredUserInfo) {
    this.id = id;
    this.info = info;
  }
  updateInfo(newId: number, newInfo: RequiredUserInfo): void {
    this.id = newId;
    this.info = newInfo;
  }
  getId(): number {
    return this.id;
  }
  getInfo(): RequiredUserInfo {
    return this.info;
  }
}
interface Profile4 {
  username?: string;
  email?: string;
}
type RequiredProfile = Required<Profile4>;
class User4 {
  private userID: number;
  public profile: RequiredProfile;
  constructor(userID:number,profile: RequiredProfile) {
    this.userID = userID;
    this.profile = profile;
  }
  getUserID(): number | undefined {
    return this.userID;
  }
  getProfile(): RequiredProfile {
    return this.profile;
  }
}
const requiredProfile: RequiredProfile = {
  username: "Alice",
  email: "alice@example.com",
};
interface UserInfo5 {
  name: string;
  age: number;
}
type ReadonlyUserInfo = Readonly<UserInfo5>;
class User5 {
  private _id: number;
  public readonly info: ReadonlyUserInfo;
  constructor(id: number, info: ReadonlyUserInfo) {
    this._id = id;
    this.info = info;
  }
  updateId(newId: number): void {
    this._id = newId;
  }
  getId(): number {
    return this._id;
  }
  getInfo(): ReadonlyUserInfo {
    return this.info;
  }
}
interface PersonInfo {
  name: string;
  age: number;
}
type ReadonlyPersonInfo = Readonly<PersonInfo>;
class Person {
  private personalId: number | undefined;
  public readonly info: ReadonlyPersonInfo;
  constructor(personalId: number | undefined,info: ReadonlyPersonInfo) {
    this.personalId = personalId;
    this.info = info;
  }
  getPersonalId(): number | undefined {
    return this.personalId;
  }
  getInfo(): ReadonlyPersonInfo {
    return this.info;
  }
}
interface NumberInfo {
  num: number;
}
class NumberHolder {
  private num: number;
  constructor(num: number) {
    this.num = num;
  }
  setNum(num: number): void {
    this.num = num;
  }
  updateInfo(info: Partial<NumberInfo>): void {
    if (info.num!== undefined) {
      this.num = info.num!;
    }
  }
  getNum(): number {
    return this.num;
  }
}
interface StringInfo {
  str: string;
}
class StringHolder {
  private str: string;
  constructor(str: string) {
    this.str = str;
  }
  setStr(str: string): void {
    this.str = str;
  }
  updateInfo(info: Partial<StringInfo>): void {
    if (info.str!== undefined) {
      this.str = info.str!;
    }
  }
  getStr(): string {
    return this.str;
  }
}
interface BooleanInfo {
  bool: boolean;
}
class BooleanHolder {
  private bool: boolean;
  constructor(bool: boolean) {
    this.bool = bool;
  }
  setBool(bool: boolean): void {
    this.bool = bool;
  }
  updateInfo(info: Partial<BooleanInfo>): void {
    if (info.bool!== undefined) {
      this.bool = info.bool!;
    }
  }
  getBool(): boolean {
    return this.bool;
  }
}
interface NullInfo {
  nullValue: null;
}
class NullHolder {
  private nullValue: null;
  constructor(nullValue: null) {
    this.nullValue = nullValue;
  }
  setNullValue(nullValue: null): void {
    this.nullValue = nullValue;
  }
  updateInfo(info: Partial<NullInfo>): void {
    if (info.nullValue!== undefined) {
      this.nullValue = info.nullValue!;
    }
  }
  getNullValue(): null {
    return this.nullValue;
  }
}
interface UndefinedInfo {
  undefinedValue: undefined;
}
class UndefinedHolder {
  private undefinedValue: undefined;
  constructor(undefinedValue: undefined) {
    this.undefinedValue = undefinedValue;
  }
  setNullValue(undefinedValue: undefined): void {
    this.undefinedValue = undefinedValue;
  }
  updateInfo(info: Partial<UndefinedInfo>): void {
    if (info.undefinedValue == undefined) {
      this.undefinedValue = info.undefinedValue;
    }

  }
  getUndefinedValue(): undefined {
    return this.undefinedValue;
  }
}
interface BigIntInfo {
  bigNum: bigint;
}
class BigIntHolder {
  private bigNum: bigint;
  constructor(bigNum: bigint) {
    this.bigNum = bigNum;
  }
  setBigNum(bigNum: bigint): void {
    this.bigNum = bigNum;
  }
  updateInfo(info: Partial<BigIntInfo>): void {
    if (info.bigNum!== undefined) {
      this.bigNum = info.bigNum!;
    }
  }
  getBigNum(): bigint {
    return this.bigNum;
  }
}
interface Str {
  key: string;
}
interface ObjectInfo {
  obj: Str;
}
class ObjectHolder {
  private obj: Str;
  constructor(obj: Str) {
    this.obj = obj;
  }
  setObj(obj: Str): void {
    this.obj = obj;
  }
  updateInfo(info: Partial<ObjectInfo>): void {
    if (info.obj!== undefined) {
      this.obj = info.obj!;
    }
  }
  getObj(): Str {
    return this.obj;
  }
}
enum Color {
  Red,
  Green,
  Blue
}
interface EnumInfo {
  color: Color;
}
class EnumHolder {
  private color: Color;
  constructor(color: Color) {
    this.color = color;
  }
  setColor(color: Color): void {
    this.color = color;
  }
  updateInfo(info: Partial<EnumInfo>): void {
    if (info.color!== undefined) {
      this.color = info.color!;
    }
  }
  getColor(): Color {
    return this.color;
  }
}
interface Address {
  street: string;
  city: string;
}
interface AddressInfo {
  address: Address;
}
class AddressHolder {
  private address: Address;
  constructor(address: Address) {
    this.address = address;
  }
  setAddress(address: Address): void {
    this.address = address;
  }
  updateInfo(info: Required<AddressInfo>): void {
    this.address = info.address;
  }
  getAddress(): Address {
    return this.address;
  }
}
interface NumericInfo {
  quantity: number;
}
class QuantityHolder {
  private quantity: number;
  constructor(quantity: number) {
    this.quantity = quantity;
  }
  setQuantity(quantity: number): void {
    this.quantity = quantity;
  }
  updateInfo(info: Required<NumericInfo>): void {
    this.quantity = info.quantity;
  }
  getQuantity(): number {
    return this.quantity;
  }
}
interface TextInfo {
  message: string;
}
class MessageHolder {
  private message: string;
  constructor(message: string) {
    this.message = message;
  }
  setMessage(message: string): void {
    this.message = message;
  }
  updateInfo(info: Required<TextInfo>): void {
    this.message = info.message;
  }
  getMessage(): string {
    return this.message;
  }
}
interface FlagInfo {
  isActive: boolean;
}
class FlagHolder {
  private isActive: boolean;
  constructor(isActive: boolean) {
    this.isActive = isActive;
  }
  setIsActive(isActive: boolean): void {
    this.isActive = isActive;
  }
  updateInfo(info: Required<FlagInfo>): void {
    this.isActive = info.isActive;
  }
  getIsActive(): boolean {
    return this.isActive;
  }
}
interface NullableInfo2 {
  nullField: null;
}
class NullHolder2 {
  private nullField: null;
  constructor(nullField: null) {
    this.nullField = nullField;
  }
  setNullField(nullField: null): void {
    this.nullField = nullField;
  }
  updateInfo(info: Required<NullableInfo2>): void {
    this.nullField = info.nullField;
  }
  getNullField(): null {
    return this.nullField;
  }
}
interface BigIntInfo2 {
  largeNumber: bigint;
}
class BigIntHolder2 {
  private largeNumber: bigint;
  constructor(largeNumber: bigint) {
    this.largeNumber = largeNumber;
  }
  setLargeNumber(largeNumber: bigint): void {
    this.largeNumber = largeNumber;
  }
  updateInfo(info: Required<BigIntInfo2>): void {
    this.largeNumber = info.largeNumber;
  }
  getLargeNumber(): bigint {
    return this.largeNumber;
  }
}
interface UndefinedInfo2 {
  undefinedField: undefined;
}
class UndefinedHolder2 {
  private undefinedField: undefined;
  constructor(undefinedField: undefined) {
    this.undefinedField = undefinedField;
  }
  setUndefinedField(undefinedField: undefined): void {
    this.undefinedField = undefinedField;
  }
  updateInfo(info: Required<UndefinedInfo2>): void {
    this.undefinedField = info.undefinedField;
  }
  getUndefinedField(): undefined {
    return this.undefinedField;
  }
}
enum Direction {
  North,
  South,
  East,
  West
}
interface DirectionInfo {
  direction: Direction;
}
class DirectionHolder {
  private direction: Direction;
  constructor(direction: Direction) {
    this.direction = direction;
  }
  setDirection(direction: Direction): void {
    this.direction = direction;
  }
  updateInfo(info: Required<DirectionInfo>): void {
    this.direction = info.direction;
  }
  getDirection(): Direction {
    return this.direction;
  }
}
interface AmountInfo {
  amount: number;
}
class AmountContainer {
  private amount: number;
  constructor(amount: number) {
    this.amount = amount;
  }
  updateInfo(info: Readonly<AmountInfo>): void {
    this.amount = info.amount;
  }
  getAmount(): number {
    return this.amount;
  }
}
interface TextContentInfo {
  text: string;
}
class TextContentHolder {
  private text: string;
  constructor(text: string) {
    this.text = text;
  }
  updateInfo(info: Readonly<TextContentInfo>): void {
    this.text = info.text;
  }
  getText(): string {
    return this.text;
  }
}
interface StatusInfo {
  isEnabled: boolean;
}
class StatusManager {
  private isEnabled: boolean;
  constructor(isEnabled: boolean) {
    this.isEnabled = isEnabled;
  }
  updateInfo(info: Readonly<StatusInfo>): void {
    this.isEnabled = info.isEnabled;
  }
  getIsEnabled(): boolean {
    return this.isEnabled;
  }
}
interface EmptyValueInfo {
  emptyValue: null;
}
class EmptyValueHolder {
  private emptyValue: null;
  constructor(emptyValue: null) {
    this.emptyValue = emptyValue;
  }
  updateInfo(info: Readonly<EmptyValueInfo>): void {
    this.emptyValue = info.emptyValue;
  }
  getEmptyValue(): null {
    return this.emptyValue;
  }
}
interface MissingValueInfo {
  missingValue: undefined;
}
class MissingValueHolder {
  private missingValue: undefined;
  constructor(missingValue: undefined) {
    this.missingValue = missingValue;
  }
  updateInfo(info: Readonly<MissingValueInfo>): void {
    this.missingValue = info.missingValue;
  }
  getMissingValue(): undefined {
    return this.missingValue;
  }
}
interface HugeNumberInfo {
  hugeNumber: bigint;
}
class HugeNumberContainer {
  private hugeNumber: bigint;
  constructor(hugeNumber: bigint) {
    this.hugeNumber = hugeNumber;
  }
  updateInfo(info: Readonly<HugeNumberInfo>): void {
    this.hugeNumber = info.hugeNumber;
  }
  getHugeNumber(): bigint {
    return this.hugeNumber;
  }
}
enum Planet {
  Earth,
  Mars,
  Venus
}
interface PlanetInfo {
  planet: Planet;
}
class PlanetSelector {
  private planet: Planet;
  constructor(planet: Planet) {
    this.planet = planet;
  }
  updateInfo(info: Readonly<PlanetInfo>): void {
    this.planet = info.planet;
  }
  getPlanet(): Planet {
    return this.planet;
  }
}
interface User{
  name:string,
  age:number
}
interface UserInfo {
  user: User;
}
class UserProfile {
  private user: User;
  constructor(user: User) {
    this.user = user;
  }
  updateInfo(info: Readonly<UserInfo>): void {
    this.user = info.user;
  }
  getUser(): User {
    return this.user;
  }
}
export default function BuiltinsPrivateFieldsUtilityTypeTest() {
  describe('BuiltinsPrivateFieldsUtilityTypeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll( async() => {
      await sleep(50);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_0100
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest0100
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest0100';
      console.log(`${caseName} test start`);

      const person = new Person1("Alice", 25);
      console.log(`Initial Name: ${person.getName()}`);
      console.log(`Initial Age: ${person.getAge()}`);
      const partialInfo: Partial<PersonInfo1> = {
        name: "Bob",
        age: 30
      };
      person.updateInfo(partialInfo);
      console.log(`Updated Name: ${person.getName()}`);
      console.log(`Updated Age: ${person.getAge()}`);
      expect(person.getName()).assertEqual("Bob");
      expect(person.getAge()).assertEqual(30);
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_0300
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest0300
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest0300';
      console.log(`${caseName} test start`);
      const user = new User3(1, { name: 'Alice', age: 25 });
      console.log('Initial ID:', user.getId());
      console.log('Initial Info:', user.getInfo());
      const newId = 2;
      const newInfo: RequiredUserInfo = { name: 'Bob', age: 30 };
      user.updateInfo(newId, newInfo);
      console.log('Updated ID:', user.getId());
      console.log('Updated Info:', user.getInfo());
      expect(2).assertEqual(user.getId());
      expect(30).assertEqual(user.getInfo().age)
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_0400
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest0400
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest0400';
      console.log(`${caseName} test start`);
      const user = new User4(1,requiredProfile);
      console.log(`${user.getUserID()}`);
      console.log(JSON.stringify(user.getProfile()));
      expect(1).assertEqual(user.getUserID());
      expect("Alice").assertEqual(user.getProfile().username);
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_0500
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest0500
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest0500';
      console.log(`${caseName} test start`);
      const readonlyUserInfo: ReadonlyUserInfo = {
        name: "Ace",
        age: 50
      };
      const user = new User5(4, readonlyUserInfo);
      console.log("Initial ID:", user.getId());
      console.log("Initial Info:", user.getInfo());
      user.updateId(5);
      console.log("Updated ID:", user.getId());
      console.log("Updated Info:", user.getInfo());
      expect(5).assertEqual(user.getId());
      expect("Ace").assertEqual(user.getInfo().name);
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_0600
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest0600
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest0600';
      console.log(`${caseName} test start`);
      const readonlyPersonInfo: ReadonlyPersonInfo = {
        name: "Bob",
        age: 30
      };
      const person = new Person(1,readonlyPersonInfo);
      console.log(`${person.getPersonalId()}`);
      console.log(JSON.stringify(person.getInfo()));
      expect(1).assertEqual(person.getPersonalId());
      expect(30).assertEqual(person.getInfo().age);
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_0700
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest0700
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest0700';
      console.log(`${caseName} test start`);
      const numberHolder = new NumberHolder(10);
      console.log(`Initial Number: ${numberHolder.getNum()}`);
      const partialNumberInfo: Partial<NumberInfo> = {
        num: 20
      };
      numberHolder.updateInfo(partialNumberInfo);
      console.log(`Updated Number: ${numberHolder.getNum()}`);
      expect(numberHolder.getNum()).assertEqual(20);
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })



    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_0800
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest0800
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest0800';
      console.log(`${caseName} test start`);
      const stringHolder = new StringHolder("Hello");
      console.log(`Initial String: ${stringHolder.getStr()}`);
      const partialStringInfo: Partial<StringInfo> = {
        str: "World"
      };
      stringHolder.updateInfo(partialStringInfo);
      console.log(`Updated String: ${stringHolder.getStr()}`);
      expect("World").assertEqual(stringHolder.getStr());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_0900
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest0900
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest0900';
      console.log(`${caseName} test start`);
      const booleanHolder = new BooleanHolder(false);
      console.log(`Initial Boolean: ${booleanHolder.getBool()}`);
      const partialBooleanInfo: Partial<BooleanInfo> = {
        bool: true
      };
      booleanHolder.updateInfo(partialBooleanInfo);
      console.log(`Updated Boolean: ${booleanHolder.getBool()}`);
      expect(booleanHolder.getBool()).assertEqual(true);
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1100
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1100
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1100';
      console.log(`${caseName} test start`);
      const undefinedHolder = new UndefinedHolder(undefined);
      console.log(`Initial Null Value: ${undefinedHolder.getUndefinedValue()}`);
      const partialNullInfo: Partial<UndefinedInfo> = {
        undefinedValue: undefined
      };
      undefinedHolder.updateInfo(partialNullInfo);
      console.log(`Updated Null Value: ${undefinedHolder.getUndefinedValue()}`);
      expect(undefined).assertEqual(undefinedHolder.getUndefinedValue());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1200
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1200
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1200';
      console.log(`${caseName} test start`);
      const bigIntHolder = new BigIntHolder(100n);
      console.log(`Initial BigInt: ${bigIntHolder.getBigNum()}`);
      const partialBigIntInfo: Partial<BigIntInfo> = {
        bigNum: 200n
      };
      bigIntHolder.updateInfo(partialBigIntInfo);
      console.log(`Updated BigInt: ${bigIntHolder.getBigNum()}`);
      expect(200n).assertEqual(bigIntHolder.getBigNum());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })



    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1300
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1300
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1300';
      console.log(`${caseName} test start`);
      const initialObject: Str = { key: 'initial' };
      const newObject: Str = { key: 'new' };
      const objectHolder = new ObjectHolder(initialObject);
      console.log(`Initial Object: ${JSON.stringify(objectHolder.getObj())}`);
      const partialObjectInfo: Partial<ObjectInfo> = {
        obj: newObject
      };
      objectHolder.updateInfo(partialObjectInfo);
      console.log(`Updated Object: ${JSON.stringify(objectHolder.getObj())}`);
      expect(newObject).assertEqual(objectHolder.getObj());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1400
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1400
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1400';
      console.log(`${caseName} test start`);
      const enumHolder = new EnumHolder(Color.Red);
      console.log(`Initial Color: ${Color[enumHolder.getColor()]}`);
      const partialEnumInfo: Partial<EnumInfo> = {
        color: Color.Green
      };
      enumHolder.updateInfo(partialEnumInfo);
      console.log(`Updated Color: ${Color[enumHolder.getColor()]}`);
      expect(Color.Green).assertEqual(enumHolder.getColor());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1500
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1500
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1500';
      console.log(`${caseName} test start`);
      const initialAddress:Address = { street: "1st St", city: "Smallville" };
      const newAddress:Address = { street: "2nd St", city: "Metropolis" };
      const addressHolder = new AddressHolder(initialAddress);
      console.log(`Initial Address: ${JSON.stringify(addressHolder.getAddress())}`);
      const requiredAddressInfo: Required<AddressInfo> = {
        address: newAddress
      };
      addressHolder.updateInfo(requiredAddressInfo);
      console.log(`Updated Address: ${JSON.stringify(addressHolder.getAddress())}`);
      expect(newAddress).assertEqual(addressHolder.getAddress());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1600
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1600
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1600';
      console.log(`${caseName} test start`);
      const quantityHolder = new QuantityHolder(5);
      console.log(`Initial Quantity: ${quantityHolder.getQuantity()}`);
      const requiredNumericInfo: Required<NumericInfo> = {
        quantity: 15
      };
      quantityHolder.updateInfo(requiredNumericInfo);
      console.log(`Updated Quantity: ${quantityHolder.getQuantity()}`);
      expect(15).assertEqual(quantityHolder.getQuantity());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })



    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1700
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1700
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1700';
      console.log(`${caseName} test start`);
      const messageHolder = new MessageHolder("Hi");
      console.log(`Initial Message: ${messageHolder.getMessage()}`);
      const requiredTextInfo: Required<TextInfo> = {
        message: "Goodbye"
      };
      messageHolder.updateInfo(requiredTextInfo);
      console.log(`Updated Message: ${messageHolder.getMessage()}`);
      expect("Goodbye").assertEqual(messageHolder.getMessage());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1800
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1800
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1800';
      console.log(`${caseName} test start`);
      const flagHolder = new FlagHolder(false);
      console.log(`Initial Flag: ${flagHolder.getIsActive()}`);
      const requiredFlagInfo: Required<FlagInfo> = {
        isActive: true
      };
      flagHolder.updateInfo(requiredFlagInfo);
      console.log(`Updated Flag: ${flagHolder.getIsActive()}`);
      expect(true).assertEqual(flagHolder.getIsActive());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_1900
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest1900
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest1900';
      console.log(`${caseName} test start`);
      const nullHolder = new NullHolder2(null);
      console.log(`Initial Null Field: ${nullHolder.getNullField()}`);
      const requiredNullableInfo: Required<NullableInfo2> = {
        nullField: null
      };
      nullHolder.updateInfo(requiredNullableInfo);
      console.log(`Updated Null Field: ${nullHolder.getNullField()}`);
      expect(null).assertEqual(nullHolder.getNullField());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2000
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2000
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2000';
      console.log(`${caseName} test start`);
      const undefinedHolder = new UndefinedHolder2(undefined);
      console.log(`Initial Undefined Field: ${undefinedHolder.getUndefinedField()}`);
      const requiredUndefinedInfo: Required<UndefinedInfo2> = {
        undefinedField: undefined
      };
      undefinedHolder.updateInfo(requiredUndefinedInfo);
      console.log(`Updated Undefined Field: ${undefinedHolder.getUndefinedField()}`);
      expect(undefined).assertEqual(undefinedHolder.getUndefinedField());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })



    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2100
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2100
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2100';
      console.log(`${caseName} test start`);
      const bigIntHolder = new BigIntHolder2(1000n);
      console.log(`Initial BigInt: ${bigIntHolder.getLargeNumber()}`);
      const requiredBigIntInfo: Required<BigIntInfo2> = {
        largeNumber: 2000n
      };
      bigIntHolder.updateInfo(requiredBigIntInfo);
      console.log(`Updated BigInt: ${bigIntHolder.getLargeNumber()}`);
      expect(2000n).assertEqual(bigIntHolder.getLargeNumber());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2200
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2200
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2200';
      console.log(`${caseName} test start`);
      const directionHolder = new DirectionHolder(Direction.North);
      console.log(`Initial Direction: ${Direction[directionHolder.getDirection()]}`);
      const requiredDirectionInfo: Required<DirectionInfo> = {
        direction: Direction.South
      };
      directionHolder.updateInfo(requiredDirectionInfo);
      console.log(`Updated Direction: ${Direction[directionHolder.getDirection()]}`);
      expect(Direction.South).assertEqual(directionHolder.getDirection());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2300
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2300
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2300';
      console.log(`${caseName} test start`);
      const amountContainer = new AmountContainer(30);
      console.log(`Initial Amount: ${amountContainer.getAmount()}`);
      const readonlyAmountInfo: Readonly<AmountInfo> = {
        amount: 50
      };
      amountContainer.updateInfo(readonlyAmountInfo);
      console.log(`Updated Amount: ${amountContainer.getAmount()}`);
      expect(50).assertEqual(amountContainer.getAmount());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2400
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2400
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2400';
      console.log(`${caseName} test start`);
      const textContentHolder = new TextContentHolder("Old Text");
      console.log(`Initial Text: ${textContentHolder.getText()}`);
      const readonlyTextContentInfo: Readonly<TextContentInfo> = {
        text: "New Text"
      };
      textContentHolder.updateInfo(readonlyTextContentInfo);
      console.log(`Updated Text: ${textContentHolder.getText()}`);
      expect("New Text").assertEqual(textContentHolder.getText());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2500
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2500
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2500';
      console.log(`${caseName} test start`);
      const statusManager = new StatusManager(false);
      console.log(`Initial Status: ${statusManager.getIsEnabled()}`);
      const readonlyStatusInfo: Readonly<StatusInfo> = {
        isEnabled: true
      };
      statusManager.updateInfo(readonlyStatusInfo);
      console.log(`Updated Status: ${statusManager.getIsEnabled()}`);
      expect(true).assertEqual(statusManager.getIsEnabled());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2600
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2600
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2600';
      console.log(`${caseName} test start`);
      const emptyValueHolder = new EmptyValueHolder(null);
      console.log(`Initial Empty Value: ${emptyValueHolder.getEmptyValue()}`);
      const readonlyEmptyValueInfo: Readonly<EmptyValueInfo> = {
        emptyValue: null
      };
      emptyValueHolder.updateInfo(readonlyEmptyValueInfo);
      console.log(`Updated Empty Value: ${emptyValueHolder.getEmptyValue()}`);
      expect(null).assertEqual(emptyValueHolder.getEmptyValue());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2700
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2700
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2700';
      console.log(`${caseName} test start`);
      const missingValueHolder = new MissingValueHolder(undefined);
      console.log(`Initial Missing Value: ${missingValueHolder.getMissingValue()}`);
      const readonlyMissingValueInfo: Readonly<MissingValueInfo> = {
        missingValue: undefined
      };
      missingValueHolder.updateInfo(readonlyMissingValueInfo);
      console.log(`Updated Missing Value: ${missingValueHolder.getMissingValue()}`);
      expect(undefined).assertEqual(missingValueHolder.getMissingValue());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2800
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2800
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2800';
      console.log(`${caseName} test start`);
      const hugeNumberContainer = new HugeNumberContainer(BigInt(1000000));
      console.log(`Initial Huge Number: ${hugeNumberContainer.getHugeNumber()}`);
      const readonlyHugeNumberInfo: Readonly<HugeNumberInfo> = {
        hugeNumber: BigInt(2000000)
      };
      hugeNumberContainer.updateInfo(readonlyHugeNumberInfo);
      console.log(`Updated Huge Number: ${hugeNumberContainer.getHugeNumber()}`);
      expect(BigInt(2000000)).assertEqual(hugeNumberContainer.getHugeNumber());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_2900
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest2900
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest2900';
      console.log(`${caseName} test start`);
      const planetSelector = new PlanetSelector(Planet.Earth);
      console.log(`Initial Planet: ${Planet[planetSelector.getPlanet()]}`);
      const readonlyPlanetInfo: Readonly<PlanetInfo> = {
        planet: Planet.Mars
      };
      planetSelector.updateInfo(readonlyPlanetInfo);
      console.log(`Updated Planet: ${Planet[planetSelector.getPlanet()]}`);
      expect(Planet.Mars).assertEqual(planetSelector.getPlanet());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_PRIVATE_FIELDS_UTILITY_TEST_3000
     * @tc.name BuiltinsPrivateFieldsUtilityTypeTest3000
     * @tc.desc Private Fields Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPrivateFieldsUtilityTypeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPrivateFieldsUtilityTypeTest3000';
      console.log(`${caseName} test start`);
      const initialUser:User = { name: "Tom", age: 25 };
      const newUser:User = { name: "Jerry", age: 26 };
      const userProfile = new UserProfile(initialUser);
      console.log(`Initial User: ${JSON.stringify(userProfile.getUser())}`);
      const readonlyUserInfo: Readonly<UserInfo> = {
        user: newUser
      };
      userProfile.updateInfo(readonlyUserInfo);
      console.log(`Updated User: ${JSON.stringify(userProfile.getUser())}`);
      expect(newUser).assertEqual(userProfile.getUser());
      console.log(`${caseName} test end`);
      Done.unsafeCall();
    })
  })
}