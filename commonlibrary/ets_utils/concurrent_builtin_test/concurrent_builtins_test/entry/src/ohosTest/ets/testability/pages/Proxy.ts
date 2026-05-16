/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export function createProxy(target) {
  try {
    return new Proxy(target, {
      get(target, prop) {
        console.log(`读取属性: ${String(prop)}`);
        return Reflect.get(target, prop);
      },
      set(target, prop, value): boolean {
        console.log(`设置属性: ${String(prop)} = ${value}`);
        return Reflect.set(target, prop, value);
      }
    });
  } catch (error) {
    return error.name;
  }

}