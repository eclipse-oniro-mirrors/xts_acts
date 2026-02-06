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
 
export function add(a:number, b:number): number {
  return a + b;
}
export async function inderectHarImportHar( ): Promise<boolean> {
  let harName = "Staticlibraryhar"
  let lib: ESObject = await import(harName)
  let res: boolean = false
  let value: number = await lib.addHarDepHar();
  if (value == 8) {
    res = true;
  }
  return res;
}
export async function inderectHarImportHsp( ): Promise<boolean> {
  let harName = "Staticlibraryhar"
  let lib: ESObject = await import(harName)
  let res: boolean = false
  let value: number = await lib.addHarDepHsp();
  if (value == 8) {
    res = true;
  }
  return res;
}
export async function inderectHspImportHar( ): Promise<boolean> {
  let harName = "Sharelibraryhsp"
  let lib: ESObject = await import(harName)
  let res: boolean = false
  let value: number = await lib.addHspDepHar();
  if (value == 8) {
    res = true;
  }
  return res;
}
export async function inderectHspImportHsp( ): Promise<boolean> {
  let harName = "Sharelibraryhsp"
  let lib: ESObject = await import(harName)
  let res: boolean = false
  let value: number = await lib.addHspDepHsp();
  if (value == 8) {
    res = true;
  }
  return res;
}

