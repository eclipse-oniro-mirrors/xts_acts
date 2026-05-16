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
  static staticMethod(): string {
    return "Parent static method";
  }
}

class Child extends Parent {
  static callParentStaticMethod(): string {
    return Parent.staticMethod();
  }
}

class Child1 extends Parent {
  static staticMethod(): string {
    return "Child static method calling " + Parent.staticMethod();
  }
}

class Child2 extends Parent {
  callParentStaticMethod(): string {
    return Parent.staticMethod();
  }
}

class Parent1 {
  static staticProperty: string;

  static {
    Parent1.staticProperty = "Parent static property";
  }

  static staticMethod(): string {
    return Parent1.staticProperty;
  }
}

class Child3 extends Parent1 {
  static callParentStaticMethod(): string {
    return Parent1.staticMethod();
  }
}

class Child4 extends Parent {
  static childStaticProperty: string = "Child static property";

  static staticMethod(): string {
    return Child4.childStaticProperty;
  }

  static callParentStaticMethod(): string {
    return Child4.staticMethod();
  }
}

class Parent2 {
  static staticMethod(count: number): string {
    if (count <= 0) {
      return "Parent";
    }
    return "Parent static " + Parent2.staticMethod(count - 1);
  }
}

class Child5 extends Parent2 {
  static callParentStaticMethod(): string {
    return Parent2.staticMethod(2);
  }
}

export function testClassSuperclassStaticmethod0001(){
  const TAG = 'testClassSuperclassStaticmethod0001';

  if(Child.callParentStaticMethod() !== "Parent static method"){
        console.info(`${TAG} Task execution failed: Child.callParentStaticMethod(): ${Child.callParentStaticMethod()}`);
        throw new Error('Child.callParentStaticMethod() check failed, expected Parent static method');
      }
}

export function testClassSuperclassStaticmethod0002(){
  const TAG = 'testClassSuperclassStaticmethod0002';

  if(Child1.staticMethod() !== "Child static method calling Parent static method"){
        console.info(`${TAG} Task execution failed: Child1.staticMethod(): ${Child1.staticMethod()}`);
        throw new Error('Child1.staticMethod() check failed, expected Child static method calling Parent static method');
      }
}

export function testClassSuperclassStaticmethod0003(){
  const TAG = 'testClassSuperclassStaticmethod0003';

        const childInstance = new Child2();
  if(childInstance.callParentStaticMethod() !== "Parent static method"){
        console.info(`${TAG} Task execution failed: childInstance.callParentStaticMethod(): ${childInstance.callParentStaticMethod()}`);
        throw new Error('childInstance.callParentStaticMethod() check failed, expected Parent static method');
      }
}

export function testClassSuperclassStaticmethod0005(){
  const TAG = 'testClassSuperclassStaticmethod0005';

  if(Child4.callParentStaticMethod() !== "Child static property"){
        console.info(`${TAG} Task execution failed: Child4.callParentStaticMethod(): ${Child4.callParentStaticMethod()}`);
        throw new Error('Child4.callParentStaticMethod() check failed, expected Child static property');
      }
}

export function testClassSuperclassStaticmethod0006(){
  const TAG = 'testClassSuperclassStaticmethod0006';

        const result = Child5.callParentStaticMethod();
  if(result !== "Parent static Parent static Parent"){
        console.info(`${TAG} Task execution failed: result: ${result}`);
        throw new Error('result check failed, expected Parent static Parent static Parent');
      }
}
