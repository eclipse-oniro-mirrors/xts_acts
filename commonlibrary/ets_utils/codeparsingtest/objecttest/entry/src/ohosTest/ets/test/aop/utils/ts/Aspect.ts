/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

type AnyType = Object | null | undefined;

export class Aspect {
  private static checkMethodType(func: Function, methodName: string): boolean {
    if (typeof func !== 'function') {
      throw new Error(`Parameter error. The type of ${methodName} must be a method of targetClass`);
    }
    return func.constructor.name === 'AsyncFunction';
  }

  private static checkParameters(targetClass: Object, methodName: string, isStatic: boolean): void {
    if (typeof (targetClass as Object) === 'undefined') {
      throw new Error(`Parameter error. The type of ${targetClass} must be Object`);
    }
    if (typeof methodName !== 'string') {
      throw new Error(`Parameter error. The type of ${methodName} must be string`);
    }
    if (typeof isStatic !== 'boolean') {
      throw new Error(`Parameter error. The type of ${isStatic} must be boolean`);
    }
  }

  static addBefore(targetClass: Object, methodName: string, isStatic: boolean, before: Function): void {
    Aspect.checkParameters(targetClass, methodName, isStatic);
    if (typeof before !== 'function') {
      throw new Error(`Parameter error. The type of ${before} must be function`);
    }
    let obj = isStatic ? targetClass : Reflect.get(targetClass, 'prototype');
    if (!obj) {
      return;
    }
    let oldFunc = obj[methodName];
    if (!Aspect.checkMethodType(oldFunc, methodName)) {
      let newFunc = function(...args : AnyType[]): AnyType {
        before(this, ...args);
        let ret = oldFunc.bind(this)(...args);
        return ret;
      };
      obj[methodName] = newFunc;
    } else {
      let newFunc = async function (...args : AnyType[]): Promise<AnyType> {
        before(this, ...args);
        let ret = oldFunc.bind(this)(...args);
        return ret;
      };
      obj[methodName] = newFunc;
    }
  }

  static addAfter(targetClass: Object, methodName: string, isStatic: boolean, after: Function): void {
    Aspect.checkParameters(targetClass, methodName, isStatic);
    if (typeof after !== 'function') {
      throw new Error(`Parameter error. The type of ${after} should be function.`);
    }
    let obj = isStatic ? targetClass : Reflect.get(targetClass, 'prototype');
    if (!obj) {
      return;
    }
    let oldFunc = obj[methodName];
    if (!Aspect.checkMethodType(oldFunc, methodName)) {
      let newFunc = function(...args : AnyType[]): AnyType {
        let ret1 = oldFunc.bind(this)(...args);
        let ret2 = after(this, ret1, ...args);
        return ret2;
      };
      obj[methodName] = newFunc;
    } else {
      let newFunc = async function (...args : AnyType[]): Promise<AnyType> {
        let ret1 = oldFunc.bind(this)(...args);
        let ret2 = after(this, ret1, ...args);
        return ret2;
      };
      obj[methodName] = newFunc;
    }
  }

  static replace(targetClass: Object, methodName: string, isStatic: boolean, instead: Function) : void {
    Aspect.checkParameters(targetClass, methodName, isStatic);
    if (typeof instead !== 'function') {
      throw new Error(`Parameter error. The type of ${instead} should be function.`);
    }
    let obj = isStatic ? targetClass : Reflect.get(targetClass, 'prototype');
    if (!obj) {
      return;
    }
    let oldFunc = obj[methodName];
    if (!Aspect.checkMethodType(oldFunc, methodName)) {
      let func = function(...args : AnyType[]): AnyType {
        let ret = instead(this, ...args);
        return ret;
      };
      obj[methodName] = func;
    } else {
      let func = async function (...args : AnyType[]): Promise<AnyType> {
        let ret = instead(this, ...args);
        return ret;
      };
      obj[methodName] = func;
    }
  }
}

export class NameSpaceAspect {
  private static checkParameters(namespace: ESObject, methodName: string): void {
    if (typeof namespace === 'undefined' || namespace === null) {
      throw new Error(`Parameter error. The namespace cannot be null or undefined`);
    }
    if (typeof methodName !== 'string') {
      throw new Error(`Parameter error. The type of ${methodName} must be string`);
    }
  }

  static addBefore(namespace: ESObject, methodName: string, before: Function): void {
    NameSpaceAspect.checkParameters(namespace, methodName);
    if (typeof before !== 'function') {
      throw new Error(`Parameter error. The type of before must be function`);
    }
    let oldFunc = (namespace as Record<string, Function>)[methodName];
    if (!oldFunc || typeof oldFunc !== 'function') {
      throw new Error(`Parameter error. ${methodName} is not a function`);
    }
    let isAsync = oldFunc.constructor.name === 'AsyncFunction';
    if (!isAsync) {
      let newFunc = function(...args: AnyType[]): AnyType {
        before(...args);
        return oldFunc(...args);
      };
      (namespace as Record<string, Function>)[methodName] = newFunc;
    } else {
      let newFunc = async function(...args: AnyType[]): Promise<AnyType> {
        before(...args);
        return await oldFunc(...args);
      };
      (namespace as Record<string, Function>)[methodName] = newFunc;
    }
  }

  static addAfter(namespace: ESObject, methodName: string, after: Function): void {
    NameSpaceAspect.checkParameters(namespace, methodName);
    if (typeof after !== 'function') {
      throw new Error(`Parameter error. The type of after must be function`);
    }
    let oldFunc = (namespace as Record<string, Function>)[methodName];
    if (!oldFunc || typeof oldFunc !== 'function') {
      throw new Error(`Parameter error. ${methodName} is not a function`);
    }
    let isAsync = oldFunc.constructor.name === 'AsyncFunction';
    if (!isAsync) {
      let newFunc = function(...args: AnyType[]): AnyType {
        let ret1 = oldFunc.bind(this)(...args);
        let ret2 = after(this, ret1, ...args);
        return ret2;
      };
      (namespace as Record<string, Function>)[methodName] = newFunc;
    } else {
      let newFunc = async function(...args: AnyType[]): Promise<AnyType> {
        let ret1 = oldFunc.bind(this)(...args);
        let ret2 = after(this, ret1, ...args);
        return ret2;
      };
      (namespace as Record<string, Function>)[methodName] = newFunc;
    }
  }

  static replace(namespace: ESObject, methodName: string, instead: Function): void {
    NameSpaceAspect.checkParameters(namespace, methodName);
    if (typeof instead !== 'function') {
      throw new Error(`Parameter error. The type of instead must be function`);
    }
    let oldFunc = (namespace as Record<string, Function>)[methodName]
    if (!oldFunc || typeof oldFunc !== 'function') {
      throw new Error(`Parameter error. ${methodName} is not a function`);
    }
    let isAsync = oldFunc.constructor.name === 'AsyncFunction';
    if (!isAsync) {
      let newFunc = function(...args: AnyType[]): AnyType {
        return instead(...args);
      };
      (namespace as Record<string, Function>)[methodName] = newFunc;
    } else {
      let newFunc = async function(...args: AnyType[]): Promise<AnyType> {
        return await instead(...args);
      };
      (namespace as Record<string, Function>)[methodName] = newFunc;
    }
  }
}