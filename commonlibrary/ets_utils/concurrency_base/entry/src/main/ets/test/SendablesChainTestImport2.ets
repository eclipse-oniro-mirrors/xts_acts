/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  DataChainedPath1
} from './SendablesChainTestImport3';
import {
  NestedDataChainedPath0,
  NestedDataChainedPath2
} from './SendablesChainTestImport4';

@Concurrent
export function taskDataFunction0(input: NestedDataChainedPath0): number {
  return input.data;
}

@Concurrent
export function taskDataFunction2(input: NestedDataChainedPath2): number {
  return input.data;
}

@Concurrent
export function extractDataJob(dataChainedPath1: DataChainedPath1) {
  return dataChainedPath1.data;
}
