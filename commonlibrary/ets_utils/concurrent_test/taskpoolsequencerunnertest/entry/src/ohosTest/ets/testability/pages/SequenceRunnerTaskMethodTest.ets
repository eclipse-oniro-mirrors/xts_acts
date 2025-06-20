/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { Count1, Count2 } from './DataFlg';
import { lang } from '@kit.ArkTS';
import { BaseClass, DeriveClass, addFunction, AsyncLock } from './SequenceRunnerSendableTest';

import { map } from '@kit.ConnectivityKit';
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';

let bitVector: collections.BitVector = new collections.BitVector(0);

@Concurrent
export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  Count1.count++
  return args;
}

@Concurrent
export function printArgs2(args: number): number {
  console.info('printArgs: ' + args);
  Count2.count++
  return args;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printArgs3(args: number): number {
  console.info('printArgs: ' + args);
  Count1.count++
  return args;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printArgs4(args: number): number {
  console.info('printArgs: ' + args);
  Count2.count++
  return args;
}

@Concurrent
export function printArgs5(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function printArgs6(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function printArgs7(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function printArgs8(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function printArgs9(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function printArgs10(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): number {
  console.info('testTransfer arg1 byteLength: ' + arg1.byteLength);
  console.info('testTransfer arg2 byteLength: ' + arg2.byteLength);
  return 100;
}

@Concurrent
export function testFunc(arr: Array<BaseClass>, num: number): number {
  let baseInstance1 = arr[0];
  console.info('sendable: str1 is: ' + baseInstance1.str1);
  baseInstance1.SetNum = 100;
  console.info('sendable: num1 is: ' + baseInstance1.GetNum);
  console.info('sendable: isDone1 is: ' + baseInstance1.isDone1);
  // 获取斐波那契数列第num项的结果
  let res: number = baseInstance1.publicFunc(num);
  return res;
}

@Concurrent
export function printLog(arr: Array<DeriveClass>): void {
  let deriveInstance = arr[0];
  deriveInstance.printName();
}

@Concurrent
export function additionDelay(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

@Concurrent
function waitForRunner(finalString: string): string {
  return finalString;
}

@Concurrent
export function stringTaskFunction1(args: string): string {
  console.log(`Task 1 is running with input: ${args}`);
  return args;
}

@Concurrent
export function stringTaskFunction2(args: string): string {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function stringTaskFunction3(args: string): string {
  console.log(`Task 1 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function stringTaskFunction4(args: string): string {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function numberTaskFunction1(args: number): number {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function numberTaskFunction2(args: number): number {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function numberTaskFunction3(args: number): number {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function numberTaskFunction4(args: number): number {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function booleanTaskFunction1(args: boolean): boolean {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function booleanTaskFunction2(args: boolean): boolean {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function booleanTaskFunction3(args: boolean): boolean {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function booleanTaskFunction4(args: boolean): boolean {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function bigintTaskFunction1(args: bigint): bigint {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function bigintTaskFunction2(args: bigint): bigint {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function bigintTaskFunction3(args: bigint): bigint {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function bigintTaskFunction4(args: bigint): bigint {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function undefinedTaskFunction1(args: undefined): undefined {
  console.log(`Task 2 is running with input: ${args}`);
  return undefined;
}

@Concurrent
export function undefinedTaskFunction2(args: undefined): undefined {
  console.log(`Task 2 is running with input: ${args}`);
  return undefined;
}

@Concurrent
export function undefinedTaskFunction3(args: undefined): undefined {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return undefined;
}

@Concurrent
export function undefinedTaskFunction4(args: undefined): undefined {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return undefined;
}

@Concurrent
export function nullTaskFunction1(args: null): null {
  console.log(`Task 2 is running with input: ${args}`);
  return null;
}

@Concurrent
export function nullTaskFunction2(args: null): null {
  console.log(`Task 2 is running with input: ${args}`);
  return null;
}

@Concurrent
export function nullTaskFunction3(args: null): null {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return null;
}

@Concurrent
export function nullTaskFunction4(args: null): null {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return null;
}

@Concurrent
export function arrayTaskFunction1(args: Array<string>): Array<string> {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function arrayTaskFunction2(args: Array<string>): Array<string> {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function arrayTaskFunction3(args: Array<string>): Array<string> {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function arrayTaskFunction4(args: Array<string>): Array<string> {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function mapTaskFunction1(args: Map<string, string>): Map<string, string> {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function mapTaskFunction2(args: Map<string, string>): Map<string, string> {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function mapTaskFunction3(args: Map<string, string>): Map<string, string> {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function mapTaskFunction4(args: Map<string, string>): Map<string, string> {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function setTaskFunction1(args: Set<string>): Set<string> {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function setTaskFunction2(args: Set<string>): Set<string> {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function setTaskFunction3(args: Set<string>): Set<string> {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function setTaskFunction4(args: Set<string>): Set<string> {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function int_8_arrayTaskFunction1(args: Int8Array): Int8Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function int_8_arrayTaskFunction2(args: Int8Array): Int8Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function int_8_arrayTaskFunction3(args: Int8Array): Int8Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function int_8_arrayTaskFunction4(args: Int8Array): Int8Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function uint_8_arrayTaskFunction1(args: Uint8Array): Uint8Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function uint_8_arrayTaskFunction2(args: Uint8Array): Uint8Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function uint_8_arrayTaskFunction3(args: Uint8Array): Uint8Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function uint_8_arrayTaskFunction4(args: Uint8Array): Uint8Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function int_16_arrayTaskFunction1(args: Int16Array): Int16Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function int_16_arrayTaskFunction2(args: Int16Array): Int16Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function int_16_arrayTaskFunction3(args: Int16Array): Int16Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function int_16_arrayTaskFunction4(args: Int16Array): Int16Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function uint_16_arrayTaskFunction1(args: Uint16Array): Uint16Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function uint_16_arrayTaskFunction2(args: Uint16Array): Uint16Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function uint_16_arrayTaskFunction3(args: Uint16Array): Uint16Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function uint_16_arrayTaskFunction4(args: Uint16Array): Uint16Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function int_32_arrayTaskFunction1(args: Int32Array): Int32Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function int_32_arrayTaskFunction2(args: Int32Array): Int32Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function int_32_arrayTaskFunction3(args: Int32Array): Int32Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function int_32_arrayTaskFunction4(args: Int32Array): Int32Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function uint_32_arrayTaskFunction1(args: Uint32Array): Uint32Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function uint_32_arrayTaskFunction2(args: Uint32Array): Uint32Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function uint_32_arrayTaskFunction3(args: Uint32Array): Uint32Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function uint_32_arrayTaskFunction4(args: Uint32Array): Uint32Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function float_32_arrayTaskFunction1(args: Float32Array): Float32Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function float_32_arrayTaskFunction2(args: Float32Array): Float32Array {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function float_32_arrayTaskFunction3(args: Float32Array): Float32Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function float_32_arrayTaskFunction4(args: Float32Array): Float32Array {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function arrayBufferTaskFunction1(args: ArrayBuffer): ArrayBuffer {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function arrayBufferTaskFunction2(args: ArrayBuffer): ArrayBuffer {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function arrayBufferTaskFunction3(args: ArrayBuffer): ArrayBuffer {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function arrayBufferTaskFunction4(args: ArrayBuffer): ArrayBuffer {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function sharedArrayBufferTaskFunction1(args: SharedArrayBuffer): SharedArrayBuffer {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function sharedArrayBufferTaskFunction2(args: SharedArrayBuffer): SharedArrayBuffer {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function sharedArrayBufferTaskFunction3(args: SharedArrayBuffer): SharedArrayBuffer {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function sharedArrayBufferTaskFunction4(args: SharedArrayBuffer): SharedArrayBuffer {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function concatArrayTaskFunction1(args: ConcatArray<string>): ConcatArray<string> {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function concatArrayTaskFunction2(args: ConcatArray<string>): ConcatArray<string> {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function concatArrayTaskFunction3(args: ConcatArray<string>): ConcatArray<string> {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function concatArrayTaskFunction4(args: ConcatArray<string>): ConcatArray<string> {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function bitVectorTaskFunction1(args: collections.BitVector): collections.BitVector {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function bitVectorTaskFunction2(args: collections.BitVector): collections.BitVector {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function bitVectorTaskFunction3(args: collections.BitVector): collections.BitVector {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function bitVectorTaskFunction4(args: collections.BitVector): collections.BitVector {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

type union1 = string | number;
type union2 = string | number;
type union3 = string | number;
type union4 = string | number;

@Concurrent
export function unionTaskFunction1(args: union1): union1 {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function unionTaskFunction2(args: union2): union2 {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function unionTaskFunction3(args: union3): union3 {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function unionTaskFunction4(args: union4): union4 {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

enum EnumTest { RED }

@Concurrent
export function enumTaskFunction1(args: EnumTest): EnumTest {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function enumTaskFunction2(args: EnumTest): EnumTest {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function enumTaskFunction3(args: EnumTest): EnumTest {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function enumTaskFunction4(args: EnumTest): EnumTest {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

export class MyClass {
  public id: number;

  constructor(id: number,) {
    this.id = id;
  }

  public greet(): string {
    return `Hello, my name is ${this.id}!`;
  }
}

@Sendable
export class MyClassAble {
  public id: number;
  public name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }

  public greet(): string {
    return `Hello, my name is ${this.name}!`;
  }
}

@Concurrent
export function sendAbleClassTaskFunction1(args: MyClassAble): MyClassAble {
  console.log(`Task 2 is running with input: ${args}`);
  args.id
  console.log(`Task 2 is running with myclass: ${args}` + args.id);
  return args;
}

@Concurrent
export function sendAbleClassTaskFunction2(args: MyClassAble): MyClassAble {
  console.log(`Task 2 is running with input: ${args}`);
  args.greet()
  console.log(`Task 2 is running with myclass: ${args}` + args.greet());
  return args;
}

@Concurrent
export function classTaskFunction1(args: MyClass): MyClass {
  console.log(`Task 2 is running with input: ${args}`);
  args.id
  console.log(`Task 2 is running with myclass: ${args}` + args.id);
  return args;
}

@Concurrent
export function classTaskFunction2(args: MyClass): MyClass {
  console.log(`Task 2 is running with input: ${args}`);
  args.greet()
  console.log(`Task 2 is running with myclass: ${args}` + args.greet());
  return args;
}

@Sendable
class CustomData implements lang.ISendable {
  public id: number;
  public name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }

  greet(): string {
    return `Hello, my name is ${this.name}!`;
  }
}

@Concurrent
export function isInterfaceTaskFunction1(arg: lang.ISendable): lang.ISendable {
  console.info('printArgs: ' + arg);
  return arg;
}


@Concurrent
export function isInterfaceTaskFunction2(arg: lang.ISendable): lang.ISendable {
  console.info('printArgs: ' + arg);
  return arg;
}

@Concurrent
export function isInterfaceTaskFunction3(arg: lang.ISendable): lang.ISendable {
  console.info('printArgs: ' + arg);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arg;
}


@Concurrent
export function isInterfaceTaskFunction4(arg: lang.ISendable): lang.ISendable {
  console.info('printArgs: ' + arg);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arg;
}

@Sendable
type SendableFunction = (func: SendableFunction) => SendableFunction;


@Sendable
export function sampleFunction(func: SendableFunction): SendableFunction {
  console.log('Executing sampleFunction');
  return func;
}

@Concurrent
export function printSendableFunction1(arg: SendableFunction): SendableFunction {
  console.info('printArgs: ' + arg);
  return arg;
}

@Concurrent
export function printSendableFunction2(arg: SendableFunction): SendableFunction {
  console.info('printArgs: ' + arg);
  return arg;
}

@Concurrent
export function unitClampedArrayTaskFunction1(args: Uint8ClampedArray): Uint8ClampedArray {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function unitClampedArrayTaskFunction2(args: Uint8ClampedArray): Uint8ClampedArray {
  console.log(`Task 2 is running with input: ${args}`);
  return args;
}

@Concurrent
export function unitClampedArrayTaskFunction3(args: Uint8ClampedArray): Uint8ClampedArray {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function unitClampedArrayTaskFunction4(args: Uint8ClampedArray): Uint8ClampedArray {
  console.log(`Task 2 is running with input: ${args}`);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function anyTaskFunction1(args1: string, args2: string): string {
  console.log(`Task 2 is running with input: ${args1}${args2}`);
  return args1 + args2;
}

@Concurrent
export function anyTaskFunction2(args1: string, args2: string): string {
  console.log(`Task 2 is running with input: ${args1}${args2}`);
  return args1 + args2;
}

@Concurrent
export function printASON1(ason: ArkTSUtils.ASON.ISendable): ArkTSUtils.ASON.ISendable {
  console.info('printArgs: ' + ason);
  return ason;
}


@Concurrent
export function printASON2(ason: ArkTSUtils.ASON.ISendable): ArkTSUtils.ASON.ISendable {
  console.info('printArgs: ' + ason);
  return ason;
}

@Concurrent
export function printASON3(ason: ArkTSUtils.ASON.ISendable): ArkTSUtils.ASON.ISendable {
  console.info('printArgs: ' + ason);
  let s: string[] = []
  s[0].split('')[1].toString()
  return ason;
}

@Concurrent
export function printASON4(ason: ArkTSUtils.ASON.ISendable): ArkTSUtils.ASON.ISendable {
  console.info('printArgs: ' + ason);
  let s: string[] = []
  s[0].split('')[1].toString()
  return ason;
}

@Concurrent
export function printAsyncLock1(ason: AsyncLock): AsyncLock {
  console.info('printArgs: ' + ason);
  return ason;
}


@Concurrent
export function printAsyncLock2(ason: AsyncLock): AsyncLock {
  console.info('printArgs: ' + ason);
  return ason;
}

@Concurrent
export function printAsyncLock3(ason: AsyncLock): AsyncLock {
  console.info('printArgs: ' + ason);
  let s: string[] = []
  s[0].split('')[1].toString()
  return ason;
}


@Concurrent
export function printAsyncLock4(ason: AsyncLock): AsyncLock {
  console.info('printArgs: ' + ason);
  let s: string[] = []
  s[0].split('')[1].toString()
  return ason;
}