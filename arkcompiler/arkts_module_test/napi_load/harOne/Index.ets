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

import testNapi from 'libharone.so';

export { MainPage } from './src/main/ets/components/mainpage/MainPage'

export function harSOAdd(a:number, b:number, tag: string): number {
  console.info(tag, 'harSOAdd call')
  return testNapi.add(a, b);
}

export function otherHarAdd(a:number, b:number, tag: string): number {
  console.info(tag, 'otherHarAdd call')
  let har: ESObject = testNapi.loadModuleWithInfo('harTwo', 'com.acts.arttsnapiloadtest/entry_test');
  return har.add(a, b);
}

export function otherFileHarAdd(a:number, b:number, tag: string): number {
  console.info(tag, 'otherFileHarAdd call')
  let harFile: ESObject = testNapi.loadModuleWithInfo('harTwo/Index', 'com.acts.arttsnapiloadtest/entry_test');
  return harFile.add(a, b);
}

export function otherHspAdd(a:number, b:number, tag: string): number {
  console.info(tag, 'otherHspAdd call')
  let hsp: ESObject = testNapi.loadModuleWithInfo('hspTwo', 'com.acts.arttsnapiloadtest/entry_test');
  return hsp.add(a, b);
}

export function otherHspFileAdd(a:number, b:number, tag: string): number {
  console.info(tag, 'otherHspFileAdd call')
  let hspFile: ESObject = testNapi.loadModuleWithInfo('hspTwo/Test', 'com.acts.arttsnapiloadtest/entry_test');
  return hspFile.add(a, b);
}

export function loadSystemModule(tag: string): boolean {
  console.info(tag, 'otherHspFileAdd call')
  let testHilog: ESObject = testNapi.loadModuleWithInfo('@ohos.hilog', '');
  try {
    testHilog.info(0x0000, 'SystemModule', tag + ' hilog print success');
    return true;
  } catch (err) {
    return false;
  }
}
