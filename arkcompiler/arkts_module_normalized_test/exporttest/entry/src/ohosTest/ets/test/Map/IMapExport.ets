/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

export class A {
  private static instance: A;
  public map: Map<string, string>;

  private constructor() {
    this.map = new Map();
  }

  public static getInstance(): A {
    if (!A.instance) {
      A.instance = new A();
      A.instance.map.set('exampleKey', 'exampleValue');
    }
    return A.instance;
  }
}

export class GlobalInstance {
  private static instance: GlobalInstance
  private map: Map<string, boolean>;
  private constructor() {
    this.map = new Map<string, boolean>();
  }

  public static getInstance(): GlobalInstance {
    if (!GlobalInstance.instance) {
      GlobalInstance.instance = new GlobalInstance();
    }
    return GlobalInstance.instance;
  }

  public getLoadModel(module: string) {
    return this.map.get(module) === undefined ? false : true
  }

  public setLoadModel(module: string) {
    this.map.set(module, true)
  }

}
